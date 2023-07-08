package com.culture.utils.id;

import java.security.SecureRandom;
import java.util.Random;
import java.util.UUID;

public class SecureRandomUUID {

    /**
     * Generates a random UUID
     * */
    public static UUID generateUUID() {
        byte[] randomBytes = new byte[16];
        Random generator = new SecureRandom();
        generator.nextBytes(randomBytes);
        return UUID.nameUUIDFromBytes(randomBytes);
    }
}
