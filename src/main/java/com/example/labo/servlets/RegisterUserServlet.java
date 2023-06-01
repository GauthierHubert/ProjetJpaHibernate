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
        User user = new User(username,password,email,"PLAYER");

        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<User>> constraints = validator.validate(user);

        if(!username.isBlank() && !password.isBlank() && !email.isBlank()) {

            if (constraints.size()>0){
                for (ConstraintViolation<User> constraint : constraints){
                    String propertyPath = constraint.getPropertyPath().toString();
                    String errorMessage = constraint.getMessage();
                    if (propertyPath.equals("username")){
                        request.setAttribute("usernameError",errorMessage);
                    }
                    if (propertyPath.equals("password")){
                        request.setAttribute("passwordError",errorMessage);
                    }
                    if (propertyPath.equals("email")){
                        request.setAttribute("emailError",errorMessage);
                    }
                }
                request.setAttribute("register",user);
                request.getRequestDispatcher("/WEB-INF/pages/user/register.jsp").forward(request,response);
            } else {
                userService.register(user);
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } else {

            request.setAttribute("registerError", "Failed to register, please fill all the fields");

            request.getRequestDispatcher("WEB-INF/pages/user/register.jsp").forward(request,response);

        }





        if (user != null){

            response.sendRedirect(request.getContextPath() + "/");
        }
        else
            request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request,response);
    }
    public void destroy() {
    }
}
