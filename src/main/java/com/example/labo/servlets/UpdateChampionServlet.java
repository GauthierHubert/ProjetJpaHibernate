package com.example.labo.servlets;

import com.example.labo.models.entities.Champion;
import com.example.labo.models.entities.User;
import com.example.labo.models.entities.enumerations.ClassType;
import com.example.labo.models.entities.enumerations.Region;
import com.example.labo.services.impl.ChampionServiceImpl;
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

@WebServlet(name = "updateChampion", urlPatterns = "/updateChampion")
public class UpdateChampionServlet extends HttpServlet {

    @Inject
    ChampionServiceImpl championService;
    HttpSession session;



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        // Récupération des paramètres de la requête
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("2name");
        Region region = Region.valueOf(request.getParameter("2region").toUpperCase());
        ClassType classe = ClassType.valueOf(request.getParameter("2class"));


        // Création de l'objet User avec les valeurs des paramètres
        Champion champion = championService.getAllInfoById(id);
        champion.setName(name);
        champion.setRegion(region);
        champion.setClassType(classe);

        championService.update(champion);

        // Redirection vers la page "userList"
        response.sendRedirect("championList");
    }


}
