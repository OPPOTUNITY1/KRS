package com.ews.krs.util;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class PasswordUtils {
    public static String hashPassword(String password) {
        return BCrypt.withDefaults().hashToString(12, password.toCharArray());
    }
    public static boolean verifyPassword(String password, String hashedPassword) {
        BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), hashedPassword);
        return result.verified;
    }

    public static void main(String[] args) {
        String password = "1234";
        String hashedPassword = hashPassword(password);
        System.out.println("Hashed Password: " + hashedPassword);
        String hashedPassword2 = hashPassword(password);
        System.out.println("Hashed Password: " + hashedPassword2);

        boolean isPasswordCorrect = verifyPassword(password, hashedPassword);
        System.out.println("Is password correct? " + isPasswordCorrect);
        boolean isPasswordCorrect2 = verifyPassword(password, hashedPassword2);
        System.out.println("Is password correct? " + isPasswordCorrect2);
    }
}
