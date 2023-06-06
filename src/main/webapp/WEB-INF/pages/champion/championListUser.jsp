<%@ page import="com.example.labo.models.entities.Champion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="com.example.labo.models.entities.Splash" %>
<%@ page import="com.example.labo.models.entities.Loading" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
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


  <script>
    // Variable pour compter les pop-ups et générer des identifiants uniques
    let popupCounter = 0;

    // Fonction pour ouvrir une pop-up
    function openPopup(championName, classe, region ,loading, icone) {
      let main = document.getElementById('main-content');

      // Créer l'overlay
      let overlay = document.createElement("div");
      overlay.classList.add("overlay");

      // Ajouter un écouteur d'événement pour fermer la pop-up en cliquant sur l'overlay
      overlay.addEventListener("click", function () {
        closePopup(popupId, overlay);
      });

      // Créer la pop-up
      let popup = document.createElement("div");
      let popupId = "popup-" + popupCounter;
      popup.setAttribute("id", popupId);
      popup.classList.add("popup");

      // Créer le bouton de fermeture de la pop-up
      let closeButton = document.createElement("button");
      closeButton.setAttribute("type", "button");
      closeButton.addEventListener("click", function () {
        closePopup(popupId, overlay);
      });
      closeButton.classList.add("close-button");
      closeButton.innerHTML = 'Fermer';

      // Afficher le contenu de la pop-up (détails du champion) et ajouter le bouton de fermeture
      popup.style.backgroundImage = "url('" + loading + "')";
      popup.innerHTML =
              '<div class="boite">' +
              '<p>' + championName + '<img class="iconeImg" src="'+ icone +'" </p>' +
              '</div>' +
              '<div class="classType boite">' +
              '<p>'  + classe + '<img class="classTypeImg" src="'+ classType(classe) +'" </p>' +
              '</div>' +
              '<div class="region boite">' +
              '<p>' + region + '<img class="regionImg" src="'+ createRegion(region) +'" </p>' +
              '</div>';

      popup.append(closeButton);

      // Ajouter l'overlay et la pop-up au contenu principal
      main.append(overlay);
      main.append(popup);

      // Bloquer les interactions à travers l'overlay en définissant pointer-events sur 'auto'
      overlay.style.pointerEvents = 'auto';

      // Centrer la pop-up verticalement et horizontalement dans la fenêtre
      popup.style.top = (window.innerHeight - popup.offsetHeight) / 2 + 'px';
      popup.style.left = (window.innerWidth - popup.offsetWidth) / 2 + 'px';

      // Ajouter du CSS pour modifier la taille des images de classe et de région
      let imgClassType = popup.querySelector(".classTypeImg");
      imgClassType.style.width = "50px"; // Largeur de l'image de classe
      imgClassType.style.height = "50px"; // Hauteur de l'image de classe

      let imgRegion = popup.querySelector(".regionImg");
      imgRegion.style.width = "50px"; // Largeur de l'image de région
      imgRegion.style.height = "50px"; // Hauteur de l'image de région

      let imgIcone = popup.querySelector(".iconeImg");
      imgIcone.style.width = "50px"; // Largeur de l'image de région
      imgIcone.style.height = "50px"; // Hauteur de l'image de région

      // Incrémenter le compteur pour générer un nouvel identifiant unique
      popupCounter++;
    }

    // Fonction pour choisir la région
    function createRegion(region){
      let regionIcon = "default-icon.png";

      switch (region) {
        case 'BANDLE_CITY' :
          regionIcon = "images/iconeRegion/bandlecity_crest_icon.png";
          break;
        case 'BILGEWATER' :
          regionIcon = "images/iconeRegion/bilgewater_crest_icon.png";
          break;
        case 'DEMACIA' :
          regionIcon = "images/iconeRegion/demacia_crest_icon.png";
          break;
        case 'FRELJORD' :
          regionIcon = "images/iconeRegion/freljord_crest_icon.png";
          break;
        case 'IONA' :
          regionIcon = "images/iconeRegion/iona_crest_icon.png";
          break;
        case 'IXTAL' :
          regionIcon = "images/iconeRegion/ixtal_crest_icon.png";
          break;
        case 'MOUNT_TARGON' :
          regionIcon = "images/iconeRegion/mounttargon_crest_icon.png";
          break;
        case 'NOXUS' :
          regionIcon = "images/iconeRegion/noxus_crest_icon.png";
          break;
        case 'PILTOVER' :
          regionIcon = "images/iconeRegion/piltover_crest_icon.png";
          break;
        case 'SHADOW_ISLES' :
          regionIcon = "images/iconeRegion/shadowisles_crest_icon.png";
          break;
        case 'SHURIMA' :
          regionIcon = "images/iconeRegion/shurima_crest_icon.png";
          break;
        case 'VOID' :
          regionIcon = "images/iconeRegion/void_crest_icon.png";
          break;
        case 'ZAUN' :
          regionIcon = "images/iconeRegion/zaun_crest_icon.png";
          break;
        default:
          regionIcon = "default-icon.png"
      }
      return regionIcon;
    }

    // Fonction pour choisir la classe
    function classType(classType){
      let classIcon = "default-icon.png";

      switch (classType) {
        case 'CONTROLLER' :
          classIcon = "images/iconeClasse/Controller_icon.png";
          break;
        case 'FIGHTER' :
          classIcon = "images/iconeClasse/Fighter_icon.jpg";
          break;
        case 'MAGE' :
          classIcon = "images/iconeClasse/Mage_icon.jpg";
          break;
        case 'MARKSMAN' :
          classIcon = "images/iconeClasse/Marksman_icon.jpg";
          break;
        case 'SLAYER' :
          classIcon = "images/iconeClasse/Slayer_icon.jpg";
          break;
        case 'SPECIALIST' :
          classIcon = "images/iconeClasse/Specialist_icon.jpg";
          break;
        case 'TANK' :
          classIcon = "images/iconeClasse/Tank_icon.jpg";
          break;
        default:
          classIcon = "default-icon.png"
      }

      return classIcon;
    }

    // Fonction pour fermer une pop-up
    function closePopup(popupId, overlay) {
      let popup = document.getElementById(popupId);
      popup.style.display = 'none';
      overlay.style.display = 'none';
    }

  </script>



  <title>Champion List</title>

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
      <% int cpt = 0;
        for (Champion champion : championsPerPageList) {
          if (cpt == 5) {
            cpt = 0;
          }
          String splashUrl = null;
          for (Splash splash : champion.getSplash()) {
            if (splash.getUrl().endsWith("_0.jpg")) {
              splashUrl = splash.getUrl();
              break;
            }
          }
          String loadingUrl = null;
          for (Loading loading : champion.getLoading()) {
            if (loading.getUrl().endsWith("_0.jpg")) {
              loadingUrl = loading.getUrl();
              break;
            }
          }

      %>
      <%if (cpt == 0) {%>
      <tr>
        <% } %>
        <td class="td-splash">
          <div class="hover-blur">
            <img src="<%= splashUrl %>" class="splash-art">
            <form action="championPage" method="get">
              <button type="button" class="form-splash"
                      onclick="openPopup(
                              '<%= champion.getName() %>', '<%= champion.getClassType() %>' , '<%= champion.getRegion() %>',
                              '<%= loadingUrl %>', '<%= champion.getIcon() %>'
                              )"></button>
              <input type="text" name="id" value="<%= champion.getName() %>" hidden="hidden">

            </form>
            <p class="champion-name"><%= champion.getName() %>
            </p>
          </div>
        </td>

        <%if (cpt == 5) {%>
      </tr>
      <% } %>
      <%
          cpt++;
        }
      %>
      </tbody>
    </table>
  </section>


  <!-- Afficher les liens de pagination -->
  <div class="pagination">
    <% int i = currentPage - 1;
      if (currentPage > 1) { %>
    <a href="?page=<%= currentPage - 1 %>" class="next-button">&laquo; Précédent</a>
    <% } else { %>
    <p class="next-button">&laquo; Précédent</p>
    <% } %>
    <% if (currentPage > 2) { %>
    <a href="?page=1"> 1 ...</a>
    <% } %>
    <%
      if (currentPage < 2) {
        i = 1;
      }
    %>
    <% for (; i <= Math.min(currentPage + 1, totalPages); i++) { %>
    <% if (i == currentPage) { %>
    <a class="active" href="?page=<%= i %>"><%= i %>
    </a>
    <% } else { %>
    <a href="?page=<%= i %>"><%= i %>
    </a>
    <% } %>
    <% } %>
    <% if (currentPage < totalPages - 1) { %>
    <a href="?page=<%= totalPages%>">...  <%=totalPages%>
    </a>
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