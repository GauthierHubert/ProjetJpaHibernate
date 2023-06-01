package com.example.labo.exceptions;

public class LoginException extends RuntimeException{

    public LoginException(){
        super("Invalid login or password");
    }
    public LoginException(String message){
        super(message);
    }

}
