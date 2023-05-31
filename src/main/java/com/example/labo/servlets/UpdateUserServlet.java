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

        // Obtention de la session
        HttpSession session = request.getSession(true);

        // Récupération de l'ID de l'utilisateur à partir des paramètres de la requête
        Long id = Long.parseLong(request.getParameter("id"));
        System.out.println("id = " + id);

        // Obtention des informations de l'utilisateur à partir du service
        User user = userService.getAllInfoById(id);
        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getEmail();
        String role = user.getRole();

        // Stockage des informations de l'utilisateur dans la session
        session.setAttribute("USER_ID", user.getId());
        session.setAttribute("role", role);
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("email", email);

        // Redirection vers la page de mise à jour d'utilisateur
        request.getRequestDispatcher("WEB-INF/pages/user/updateUser.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        // Récupération des paramètres de la requête
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // Récupération de l'ID de l'utilisateur depuis la session

        Long id = (Long) session.getAttribute("USER_ID");
        System.out.println("id DE POST = " + id);

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
