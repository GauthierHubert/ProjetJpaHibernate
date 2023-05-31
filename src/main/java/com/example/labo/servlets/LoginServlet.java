package com.example.labo.servlets;

import com.example.labo.exceptions.InvalidPasswordUserException;
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
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;

import java.io.IOException;
import java.util.Set;


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

            Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
            Set<ConstraintViolation<User>> constraints = validator.validate(user);

            if (!constraints.isEmpty()){
                for (ConstraintViolation<User> constraint : constraints){
                    String propertyPath = constraint.getPropertyPath().toString();
                    String errorMessage = constraint.getMessage();

                    if (propertyPath.equals("login")){
                        request.setAttribute("loginError", errorMessage);
                    }else if (propertyPath.equals("password")){
                        request.setAttribute("passwordError", errorMessage);
                    }
                }
                request.setAttribute("login", login);
                request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("user", ConnectedUserDto.fromEntity(user));
            response.sendRedirect(request.getContextPath() + "/");

        }catch (InvalidPasswordUserException e){
            request.setAttribute("errorMessage", "Mot de passe ou login invalid");
        }


    }

}
