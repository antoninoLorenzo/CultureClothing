package com.culture.exceptions;

public class InvalidProductCategoryException extends Exception{
    public InvalidProductCategoryException(){
        super();
    }

    public InvalidProductCategoryException(String msg) {
        super(msg);
    }
}
