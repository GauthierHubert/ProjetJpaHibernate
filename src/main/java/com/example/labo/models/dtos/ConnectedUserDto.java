package com.example.labo.models.dtos;

import com.example.labo.models.entities.User;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;

import java.io.Serializable;

@Builder @Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class ConnectedUserDto implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String login;


    public static  ConnectedUserDto fromEntity(User user){

        return ConnectedUserDto.builder().id(user.getId()).login(user.getUsername()).build();
    }


}
