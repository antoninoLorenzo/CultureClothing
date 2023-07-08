import com.culture.utils.id.SecureRandomUUID;
import io.github.bucket4j.Bandwidth;
import io.github.bucket4j.Bucket;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.ThreadMXBean;
import java.time.Duration;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class LimitFilterTest {
    //  actual data needed in the rate limiter
    private static ConcurrentHashMap<String, Bucket> users_buckets;
    private static Bandwidth AUTH_MAX_PER_MINUTE;
    private static Bandwidth AUTH_MAX_PER_SECONDS;
    private static Bandwidth MAX_PER_MINUTE;
    private static Bandwidth MAX_PER_SECOND;
    private static int EXCEEDED_DELAY;
    private static ScheduledExecutorService executor;

    //  mockup data to test requests to server
    private static List<String> uuids;
    private static List<String> sids;

    private AtomicInteger delayed_counter = new AtomicInteger(0);

    //  initialize data to try various settings
    public static void setup(int pool_size, int max_minute, int max_second, int exceed_delay, int number_of_users) {
        //  limiter setup
        users_buckets = new ConcurrentHashMap<>();
        executor = new ScheduledThreadPoolExecutor(pool_size);
/*
        AUTH_MAX_PER_MINUTE = Bandwidth.simple(100, Duration.ofMinutes(1));
        AUTH_MAX_PER_SECONDS = Bandwidth.simple(5, Duration.ofSeconds(1));
*/
        MAX_PER_MINUTE = Bandwidth.simple(max_minute, Duration.ofMinutes(1));
        MAX_PER_SECOND = Bandwidth.simple(max_second, Duration.ofSeconds(1));

        EXCEEDED_DELAY = exceed_delay;

        //  mockup data setup
        //uuids = generateIDS(15);
        sids = generateIDS(number_of_users);
    }

    //  deallocate resources of executor like threads
    @AfterAll
    public static void shutdown() {
        executor.shutdown();
    }

    @Test
    public void lowLevelTest() {
        setup(2, 200, 15, 4, 10);
        for (int i = 0; i < 10; i ++){
            executeTest("Low level");
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                //
            }
        }
    }
    @Test
    public void midLevelTest() {
        setup(2, 200, 15, 4, 500);
        for (int i = 0; i < 10; i ++){
            executeTest("Mid level");
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                //
            }
        }
    }

    @Test
    public void highLevelTest() {
        setup(2, 300, 30, 8, 100);
        for (int i = 0; i < 10; i ++){
            executeTest("High level");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                //
            }
        }
    }

    private void executeTest(String testname) {
        int non_auth_requests = sids.size()*50;
        Thread[] non_authenticated_request_threads = new Thread[non_auth_requests];

        for (int i = 0; i < non_auth_requests; i++) {
            String sid = sids.get(i % sids.size());

            non_authenticated_request_threads[i] = new Thread(() -> throttle(sid, false));
            non_authenticated_request_threads[i].start();
        }

        for (Thread thread : non_authenticated_request_threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        printResourceUsage(testname);
    }

    //  filtering requests based on the Bucket library
    private void throttle(String sid, boolean authenticated) {
        //  get or create bucket
        Bucket bucket = null;
        if (!users_buckets.containsKey(sid))
            users_buckets.put(sid, createBucket(authenticated));

        bucket = users_buckets.get(sid);

        //  actual throttiling
        if (bucket.tryConsume(1)) {
            //  doChain
        } else {
            bucket.addTokens(1);
            executor.schedule(new RequestTask(sid), EXCEEDED_DELAY, TimeUnit.SECONDS);
            incrementDelayedRequestCounter();
        }
    }

    //  the request task will instead use FilterChain.doFilter(request, response)
    private class RequestTask implements Runnable {
        String sid;

        RequestTask(String sid) {
            this.sid = sid;
        }

        @Override
        public void run() {

        }
    }

    private Bucket createBucket(boolean authenticated) {
        Bandwidth bandwidthPerMinute = authenticated ? AUTH_MAX_PER_MINUTE : MAX_PER_MINUTE;
        Bandwidth bandwidthPerSecond = authenticated ? AUTH_MAX_PER_SECONDS : MAX_PER_SECOND;
        return Bucket.builder()
                .addLimit(bandwidthPerMinute)
                .addLimit(bandwidthPerSecond)
                .build();
    }

    private static List<String> generateIDS(int n) {
        return Stream.generate(SecureRandomUUID::generateUUID)
                .map(UUID::toString)
                .limit(n)
                .collect(Collectors.toList());
    }

    /*
    * ChatGPT
    * */
    private void printResourceUsage(String testName) {
        MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
        ThreadMXBean threadBean = ManagementFactory.getThreadMXBean();

        long usedMemory = memoryBean.getHeapMemoryUsage().getUsed() / (1024 * 1024);
        long maxMemory = memoryBean.getHeapMemoryUsage().getMax() / (1024 * 1024);
        int threadCount = threadBean.getThreadCount();
        long cpuTime = threadBean.getCurrentThreadCpuTime() / 1_000_000;

        int delayed = getDelayedRequestCount();

        System.out.println("----------------------------------");
        System.out.println("Test: " + testName);
        System.out.println("Used Memory: " + usedMemory + " MB");
        System.out.println("Max Memory: " + maxMemory + " MB");
        System.out.println("Thread Count: " + threadCount);
        System.out.println("CPU Time: " + cpuTime + " ms");
        System.out.println("Delayed Requests: " + delayed);
        System.out.println("----------------------------------");
    }

    private void incrementDelayedRequestCounter() {
        delayed_counter.incrementAndGet();
    }

    private int getDelayedRequestCount() {
        return delayed_counter.get();
    }
}
