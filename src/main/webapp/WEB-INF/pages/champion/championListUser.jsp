<%@ page import="com.example.labo.models.entities.Champion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="com.example.labo.models.entities.Splash" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 03/06/2023
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--  BOOTSTRAP  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!--  Font Awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/styleListUser.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Geologica:wght@900&display=swap" rel="stylesheet">

    <title>Champion List</title>
  </head>
</head>
<body>

<%@ include file="../user/header.jsp" %>

<main id="main-content">


  <%
    // Récupérer les champions de la requête
    List<Champion> champions = (List<Champion>) request.getAttribute("champion");

// Déterminer le nombre total de champions et le nombre de champions par page
    int totalChampions = champions.size();
    int championsPerPage = 10;

// Déterminer le numéro de page actuel
    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

// Calculer le nombre total de pages
    int totalPages = (int) Math.ceil((double) totalChampions / championsPerPage);

// Calculer l'indice de début et de fin des champions à afficher
    int startIndex = (currentPage - 1) * championsPerPage;
    int endIndex = Math.min(startIndex + championsPerPage, totalChampions);

// Récupérer les champions de la page actuelle
    List<Champion> championsPerPageList = champions.subList(startIndex, endIndex);
  %>

  <!-- Afficher les champions de la page actuelle -->
  <section class="form-div">
    <table class="table">
      <tbody>
      <%  int cpt = 0;
          for (Champion champion : championsPerPageList) {
            if(cpt==5){cpt=0;}
            String splashUrl = null;
            for (Splash splash : champion.getSplash()) {
              if (splash.getUrl().endsWith("_0.jpg")) {
                splashUrl = splash.getUrl();
                break;
              }
            }
          %>
          <%if(cpt == 0){%>
          <tr>
          <% } %>
              <td class="td-splash">
                <img src="<%= splashUrl %>" class="splash-art">
                <form action="championPage" method="get">
                  <button type="submit" class="form-splash" name="champ-page" id="champ-page"></button>
                  <input type="text" name="id" value="<%= champion.getName() %>" hidden="hidden">
                </form>
                <p class="champion-name"><%= champion.getName() %></p>
              </td>

          <%if(cpt == 5){%>
          </tr>
          <% } %>
    <%cpt++; } %>
      </tbody>
    </table>
  </section>

  <!-- Afficher les liens de pagination -->
  <div class="pagination">
    <% int i = currentPage-1; if (currentPage > 1) { %>
    <a href="?page=<%= currentPage - 1 %>" class="next-button">&laquo; Précédent</a>
    <% } else { %>
    <p class="next-button">&laquo; Précédent</p>
    <% } %>
    <% if (currentPage > 2) { %>
    <a href="?page=1"> 1  ...</a>
    <% } %>
    <%if(currentPage < 2){
       i = 1;
    }%>
    <% for (; i <= Math.min(currentPage +1, totalPages); i++) { %>
    <% if (i == currentPage) { %>
    <a class="active" href="?page=<%= i %>"><%= i %></a>
    <% } else { %>
    <a href="?page=<%= i %>"><%= i %></a>
    <% } %>
    <% } %>
    <% if (currentPage < totalPages-1) { %>
    <a href="?page=<%= totalPages%>">...  <%=totalPages%> </a>
    <% } %>
    <% if (currentPage < totalPages) { %>
    <a href="?page=<%= currentPage + 1 %>" class="next-button">Suivant &raquo;</a>
    <% } else { %>
    <p class="next-button">Suivant &raquo;</p>
    <% } %>
  </div>
</main>

</body>
</html>
