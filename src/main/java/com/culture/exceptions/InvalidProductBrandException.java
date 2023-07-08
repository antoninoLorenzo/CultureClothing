package com.culture.exceptions;

public class InvalidProductBrandException extends Exception{
    public InvalidProductBrandException() {
        super();
    }

    public InvalidProductBrandException(String msg) {
        super(msg);
    }
}
