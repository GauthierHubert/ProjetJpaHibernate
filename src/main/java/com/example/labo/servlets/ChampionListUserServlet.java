package com.example.labo.servlets;

import com.example.labo.models.entities.Champion;
import com.example.labo.services.impl.ChampionServiceImpl;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "championListUser", urlPatterns = "/championListUser")
public class ChampionListUserServlet extends HttpServlet {

    @Inject
    ChampionServiceImpl championService;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<Champion> champions = championService.getMany();

        System.out.println("champions.size() = " + champions.size());
        request.setAttribute("champion", champions);

        request.getRequestDispatcher("/WEB-INF/pages/champion/championListUser.jsp").forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}