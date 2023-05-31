package com.example.labo.exceptions;

public class EntityNotFoundException extends EntityException {

    public EntityNotFoundException() {
        super("User not found.");
    }

    public EntityNotFoundException(String message) {
        super(message);
    }
}
