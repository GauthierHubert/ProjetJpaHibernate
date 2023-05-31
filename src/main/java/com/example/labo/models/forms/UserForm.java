package com.example.labo.models.forms;

import com.example.labo.models.entities.User;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter @Setter @Builder @AllArgsConstructor @NoArgsConstructor @ToString
public class UserForm {


    @NotBlank(message = "Information obligatoire")
    @Size(min = 3, max = 15, message = "La taille doit être comprise en 5 et 15")
    private String username;

    @NotBlank(message = "Information obligatoire")
    @Size(min = 4, message = "La taille doit être comprise en 4 et 30")
    private String password;

    @Email(message = "Vous devez mettre un mail valide")
    @NotBlank(message = "Information obligatoire")
    @Size(min = 5, message = "La taille minimum est de 5")
    private String email;

    @NotBlank(message = "Information obligatoire")
    @Size()
    private String role;



    public User toEntity(){
        return new User(username, password, email, role);
    }

}
