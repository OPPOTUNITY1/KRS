package com.ews.krs.util;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

public class VerificationUtils {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int CODE_LENGTH = 6;
    private static final Random RANDOM = new SecureRandom();
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_+=<>?";
    private static final int MIN_PASSWORD_LENGTH = 8;
    public static String generateVerificationCode() {
        StringBuilder code = new StringBuilder(CODE_LENGTH);
        for (int i = 0; i < CODE_LENGTH; i++) {
            code.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return code.toString();
    }

    public static String generateRandomPassword() {
        if (MIN_PASSWORD_LENGTH < 4) {
            throw new IllegalArgumentException("Minimum password length must be at least 4 to include all required character types.");
        }

        StringBuilder password = new StringBuilder(MIN_PASSWORD_LENGTH);

        // Ensure the password has at least one uppercase letter, one number, and one special character
        password.append(getRandomCharacter("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
        password.append(getRandomCharacter("0123456789"));
        password.append(getRandomCharacter(SPECIAL_CHARACTERS));

        // Fill the rest of the password length with random characters
        for (int i = 3; i < MIN_PASSWORD_LENGTH; i++) {
            password.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }

        // Shuffle the characters to ensure randomness
        return shuffleString(password.toString());
    }

    private static String getRandomCharacter(String characters) {
        return String.valueOf(characters.charAt(RANDOM.nextInt(characters.length())));
    }

    private static String shuffleString(String input) {
        StringBuilder output = new StringBuilder(input.length());
        int[] indices = new int[input.length()];
        for (int i = 0; i < input.length(); i++) {
            indices[i] = i;
        }
        for (int i = input.length(); i > 0; i--) {
            int randomIndex = RANDOM.nextInt(i);
            output.append(input.charAt(indices[randomIndex]));
            indices[randomIndex] = indices[i - 1];
        }
        return output.toString();
    }

    public static void main(String[] args) {
        String verificationCode = generateVerificationCode();
        System.out.println("Verification Code: " + verificationCode);

        String randomPassword = generateRandomPassword();
        System.out.println("Random Password: " + randomPassword);
    }
}
