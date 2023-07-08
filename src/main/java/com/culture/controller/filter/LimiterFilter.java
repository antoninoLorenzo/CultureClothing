package com.culture.controller.filter;

import com.culture.utils.id.SecureRandomUUID;
import io.github.bucket4j.Bandwidth;
import io.github.bucket4j.Bucket;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.Duration;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@WebFilter(filterName = "requestLimiterFilter"
        , urlPatterns = {"/*"}
        , dispatcherTypes = DispatcherType.REQUEST)
public class LimiterFilter extends HttpFilter {
    private ConcurrentHashMap<String, Bucket> users_buckets;
    private Bandwidth MAX_PER_MINUTE;
    private Bandwidth MAX_PER_SECOND;
    private static int EXCEEDED_DELAY;
    private static ScheduledExecutorService executor;

    @Override
    public void init() throws ServletException {
        //  limiter setup
        users_buckets = new ConcurrentHashMap<>();

        MAX_PER_MINUTE = Bandwidth.simple(300, Duration.ofMinutes(1));
        MAX_PER_SECOND = Bandwidth.simple(30, Duration.ofSeconds(1));

        EXCEEDED_DELAY = 8;

        executor = new ScheduledThreadPoolExecutor(4);
    }

    /**
     * Funziona quando l'accesso viene effettuato da un utente
     * Non limita pero' gli attacchi DDOS, test w/Raven-Storm
     * */
    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("CC_SID") == null) {
            session = request.getSession(true);
            session.setAttribute("CC_SID", SecureRandomUUID.generateUUID().toString());
        }

        String sid = session.getAttribute("CC_SID").toString();

        //  get or create bucket
        Bucket bucket = null;
        if (!users_buckets.containsKey(sid))
            users_buckets.put(sid, createBucket());

        bucket = users_buckets.get(sid);

        //  actual throttiling
        if (bucket.tryConsume(1)) {
            chain.doFilter(request, response);
        } else {
            System.out.println("Rejected");
            bucket.addTokens(1);
            executor.schedule(new RequestTask(request, response, chain), EXCEEDED_DELAY, TimeUnit.SECONDS);
        }
    }

    @Override
    public void destroy() {
        executor.shutdown();
    }

    /**
     * Create a new bucket witht two limits
     * */
    private Bucket createBucket() {
        return Bucket.builder()
                .addLimit(MAX_PER_MINUTE)
                .addLimit(MAX_PER_SECOND)
                .build();
    }

    /**
     * When a user exceeds request limits he still needs to be able to get a response
     * but with a certain delay, so chain.doFilter(request, response) will be scheduled
     * */
    private class RequestTask implements Runnable {
        HttpServletRequest request;
        HttpServletResponse response;
        FilterChain chain;

        RequestTask(HttpServletRequest request, HttpServletResponse response, FilterChain chain) {
            this.request = request;
            this.response = response;
            this.chain = chain;
        }

        @Override
        public void run() {
            try {
                chain.doFilter(request, response);
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ServletException e) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }
}
