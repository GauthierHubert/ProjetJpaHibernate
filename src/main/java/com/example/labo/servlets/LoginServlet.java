package com.example.labo.servlets;

import com.example.labo.exceptions.LoginException;
import com.example.labo.models.dtos.ConnectedUserDto;
import com.example.labo.models.entities.User;
import com.example.labo.repositories.UserRepository;
import com.example.labo.services.impl.UserServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "login", urlPatterns = "/login", loadOnStartup = 1)
public class LoginServlet extends HttpServlet {
    @Inject
    private UserRepository userRepository;
    @Inject
    private UserServiceImpl userService;

    public void init(){

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        request.setAttribute("login", "");       //chaine de caratère vide en début
        request.getRequestDispatcher("WEB-INF/pages/user/login.jsp").forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {



        String login = request.getParameter("login");
        String password = request.getParameter("password");

        try{
            User user = userService.login(login, password);
            HttpSession session = request.getSession(true);
            session.setAttribute("user", ConnectedUserDto.fromEntity(user));
            session.setAttribute("role", user.getRole());


        } catch (RuntimeException e) {
            request.setAttribute("loginError", "Invalid login or password");
            request.getRequestDispatcher("WEB-INF/pages/user/login.jsp").forward(request, response);
        }

        response.sendRedirect(request.getContextPath() + "/");
    }

}
