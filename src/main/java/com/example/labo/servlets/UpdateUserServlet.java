package com.example.labo.servlets;

import com.example.labo.models.entities.User;
import com.example.labo.services.impl.UserServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name = "updateUser", urlPatterns = "/updateUser")
public class UpdateUserServlet extends HttpServlet {

    @Inject
    UserServiceImpl userService;
    HttpSession session;



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        // Récupération des paramètres de la requête
        String username = request.getParameter("2username");
        String password = request.getParameter("2password");
        String email = request.getParameter("2email");
        String role = request.getParameter("2role");
        Long id = Long.parseLong(request.getParameter("id"));

        // Récupération du mot de passe original de l'utilisateur
        String originalPassword = userService.getAllInfoById(id).getPassword();

        // Création de l'objet User avec les valeurs des paramètres
        User user = userService.getAllInfoById(id);
        user.setUsername(username);
        user.setEmail(email);
        user.setRole(role);

        if (password.isEmpty()) {
            // Le champ du mot de passe est vide, utilisez le mot de passe d'origine
            user.setPassword(originalPassword);
        }else{
            //Si le champ n'est pas vide, le mot de passe est hashé
            user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
        }

        // Appel de la méthode de service pour mettre à jour l'utilisateur
        userService.update(user);

        // Redirection vers la page "userList"
        response.sendRedirect("userList");
    }


}
