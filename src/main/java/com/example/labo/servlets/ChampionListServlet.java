package com.example.labo.servlets;

import com.example.labo.models.entities.Champion;
import com.example.labo.models.entities.User;
import com.example.labo.repositories.UserRepository;
import com.example.labo.repositories.impl.UserRepositoryImpl;
import com.example.labo.services.impl.ChampionServiceImpl;
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

@WebServlet(name = "championList", urlPatterns = "/championList")
public class ChampionListServlet extends HttpServlet {

    @Inject
    ChampionServiceImpl championService;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<Champion> champions = championService.getMany();

        System.out.println("champions.size() = " + champions.size());
        request.setAttribute("champion", champions);

        request.getRequestDispatcher("/WEB-INF/pages/champion/championList.jsp").forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("id")!=null){
            Long id = Long.parseLong(request.getParameter("id"));
            Champion champion = championService.getAllInfoById(id);
            championService.delete(champion, id);
        }
        response.sendRedirect(request.getContextPath() + "/championList");
    }



}