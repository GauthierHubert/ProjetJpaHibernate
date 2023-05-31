package com.example.labo.models.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.lang.reflect.Field;


@NoArgsConstructor @AllArgsConstructor @Getter @Setter
@Table(name = "UTILISATEUR")
@Entity
public class User implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID")
    private Long id;


    @Column(name = "USERNAME",length = 40)
    private String username;


    @Column(name = "PASSWORD",length = 100)
    private String password;


    @Column(name = "EMAIL",length = 60)
    private String email;

    @Column(name = "SCORE")
    private Integer score=0;

    @Column(name = "ROLE",length = 60)
    private String role;

    public User(String username, String password, String email, String role){
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
        if(role.equals("ADMIN"))
            this.score = null;
        else
            this.score = 0;
    }


}
