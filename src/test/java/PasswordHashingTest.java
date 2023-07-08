import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordHashingTest {
    @Test
    public void testHashPassword() {
        String original = "hello";
        String hash = BCrypt.hashpw(original, BCrypt.gensalt());
        Assertions.assertTrue(BCrypt.checkpw(original, hash));
        Assertions.assertFalse(BCrypt.checkpw("hell", hash));
    }
}
