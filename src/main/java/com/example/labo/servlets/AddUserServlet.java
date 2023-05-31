package com.example.labo.servlets;


import com.example.labo.models.entities.User;
import com.example.labo.models.forms.UserForm;
import com.example.labo.services.impl.UserServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;

import java.io.IOException;
import java.util.Set;
@WebServlet(name = "addUser", urlPatterns = "/addUser")
public class AddUserServlet extends HttpServlet {

    @Inject
    private UserServiceImpl userService;


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/user/addUser.jsp").forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        UserForm userForm = new UserForm(username, password, email, role);

        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<UserForm>> constraints = validator.validate(userForm);

        if (!constraints.isEmpty()) {
            for (ConstraintViolation<UserForm> constraint : constraints) {
                String propertyPath = constraint.getPropertyPath().toString();
                String errorMessage = constraint.getMessage();

                if (propertyPath.equals("username")) {
                    request.setAttribute("usernameError", errorMessage);
                } else if (propertyPath.equals("password")) {
                    request.setAttribute("passwordError", errorMessage);
                } else if (propertyPath.equals("email")) {
                    request.setAttribute("emailError", errorMessage);
                }
            }

            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/WEB-INF/pages/user/addUser.jsp").forward(request, response);
        } else {
            User user = userService.add(userForm);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }


}
