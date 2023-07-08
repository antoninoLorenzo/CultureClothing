package com.culture.exceptions;

public class OrderFailedException extends Exception {
    public OrderFailedException() { super(); }
    public OrderFailedException(String msg) { super(msg); }
}
