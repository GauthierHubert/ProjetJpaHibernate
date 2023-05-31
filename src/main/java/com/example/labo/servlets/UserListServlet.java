package com.example.labo.servlets;

import com.example.labo.models.entities.User;
import com.example.labo.repositories.UserRepository;
import com.example.labo.repositories.impl.UserRepositoryImpl;
import com.example.labo.services.impl.UserServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "userList", urlPatterns = "/userList")
public class UserListServlet extends HttpServlet {

    @Inject
    UserServiceImpl userService;
    HttpSession session;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<User> users = userService.getMany();

        System.out.println("users.size() = " + users.size());
        request.setAttribute("user", users);

        request.getRequestDispatcher("WEB-INF/pages/user/userList.jsp").forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("id")!=null){
            Long id = Long.parseLong(request.getParameter("id"));
            User user = userService.getAllInfoById(id);
            userService.delete(user, id);
        }
        response.sendRedirect(request.getContextPath() + "/userList");
    }

    @Override
    public void init() throws ServletException {

    }

}