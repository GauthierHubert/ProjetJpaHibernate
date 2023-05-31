package com.example.labo.repositories;

import com.example.labo.models.entities.User;

public interface UserRepository extends BaseRepository<Long, User>{

    User getAllinfoById(Long id);

    User findByLogin(String login);

}
