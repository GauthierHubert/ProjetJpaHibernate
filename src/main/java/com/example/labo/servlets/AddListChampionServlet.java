package com.example.labo.servlets;


import com.example.labo.models.entities.Champion;
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

@WebServlet(name = "addListChampion", urlPatterns = "/addListChampion")
public class AddListChampionServlet extends HttpServlet {

    @Inject
    private ChampionServiceImpl championService;


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/champion/addListChampion.jsp").forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File dossier = new File("C:/Users/studentdev08/IdeaProjects/ProjetJpaHibernate/src/main/webapp/images/1");

        if(dossier.isDirectory()) {
            File[] fichiers = dossier.listFiles();
            for (File icon : fichiers) {
                if (icon.isFile()) {
                    String name = icon.getName().substring(0, icon.getName().lastIndexOf("."));

                    ChampionForm championForm = new ChampionForm(name/*, aClassType, region, creationDate */);
                    Champion champion = championService.add(championForm);
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/championList");
    }
}
