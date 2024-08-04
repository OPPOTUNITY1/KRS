package com.ews.krs.util;

// Custom exception class
public class ForeignKeyConstraintException extends Exception {
    public ForeignKeyConstraintException(String message) {
        super(message);
    }
}