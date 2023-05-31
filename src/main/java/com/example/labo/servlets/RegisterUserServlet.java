package com.example.labo.servlets;

import com.example.labo.models.entities.User;
import com.example.labo.services.impl.UserServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "register" ,urlPatterns = "/register",loadOnStartup = 1)
public class RegisterUserServlet extends HttpServlet {

    @Inject
    UserServiceImpl userService;
    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("register","");
        request.getRequestDispatcher("WEB-INF/pages/user/register.jsp").forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        //
        User user = userService.register(new User(username,password,email, "PLAYER"));
        //


        if (user != null){
//            response.sendRedirect(request.getContextPath()+"/");
            response.sendRedirect(request.getContextPath() + "/");
        }
        else
            request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request,response);
    }
    public void destroy() {
    }
}
