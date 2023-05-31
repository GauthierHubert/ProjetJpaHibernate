package com.example.labo.services.impl;

import com.example.labo.models.entities.User;
import com.example.labo.models.forms.UserForm;
import com.example.labo.repositories.UserRepository;
import com.example.labo.repositories.impl.UserRepositoryImpl;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityNotFoundException;
import org.mindrot.jbcrypt.BCrypt;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

@Named @SessionScoped
public class UserServiceImpl implements Serializable {

    @Inject
    private UserRepository userRepository;


    public User add(UserForm user){
        return userRepository.add(user.toEntity());
    }


    public User getOne(User tUser, Long id) {

        Optional<User> user = userRepository.getOne(tUser, id);
        if (user.isEmpty()) {
            throw new EntityNotFoundException();
        }
        return user.get();
    }

    public List<User> getMany(){
        System.out.println("userRepository.getAll().size() = " + userRepository.getAll().size());
        return userRepository.getAll();
    }


    public User update(User user){
        return userRepository.update(user);
    }

    public void delete(User user, Long id){

        userRepository.delete(user, id);

    }

    public User getAllInfoById(Long id){
        return userRepository.getAllinfoById(id);
    }


    public User register(User user) {

        if (user.getUsername().trim().equals(""))
            throw new RuntimeException();
        if (user.getPassword().trim().equals(""))
            throw new RuntimeException();
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));

        return userRepository.add(user);
    }

    public User login(String login, String pwd) {

        User user = userRepository.findByLogin(login);

        if (user == null) {
            throw new EntityNotFoundException();
        }

        if (!BCrypt.checkpw(pwd, user.getPassword())) {
            throw new RuntimeException();
        }

        return user;

    }
}
