package com.example.labo.servlets;


import com.example.labo.models.entities.Champion;
import com.example.labo.models.entities.enumerations.ClassType;
import com.example.labo.models.entities.enumerations.Region;
import com.example.labo.models.forms.ChampionForm;
import com.example.labo.services.impl.ChampionServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
@WebServlet(name = "addChampion", urlPatterns = "/champion/add")
public class AddChampionServlet extends HttpServlet {

    @Inject
    private ChampionServiceImpl championService;


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/user/championForm.jsp").forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        ClassType aClassType = ClassType.valueOf(request.getParameter("classType").toUpperCase());
        Region region = Region.valueOf(request.getParameter("region").toUpperCase());
        LocalDate creationDate = LocalDate.parse(request.getParameter("creationDate"), DateTimeFormatter.ISO_LOCAL_DATE);

        ChampionForm championForm = new ChampionForm(name/*, aClassType, region, creationDate */);

     /*   Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<ChampionForm>> constraints = validator.validate(championForm)*/

 /*       if(constraints.size() > 0){
            for(ConstraintViolation<UserForm> constraint : constraints)
                if(constraint.getPropertyPath().toString().equals("name")){
                    request.setAttribute("nameError", constraint.getMessage());
                }

            request.setAttribute("name", name);
            request.getRequestDispatcher("/WEB-INF/pages/animalForm.jsp").forward(request, response);
        }else{ */
        Champion champion = championService.add(championForm);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
