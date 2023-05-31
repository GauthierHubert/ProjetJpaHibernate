package com.example.labo.exceptions;

public class InvalidPasswordUserException extends RuntimeException{

    public InvalidPasswordUserException(){
        super("Invalid password");
    }
    public InvalidPasswordUserException(String message){
        super(message);
    }

}
