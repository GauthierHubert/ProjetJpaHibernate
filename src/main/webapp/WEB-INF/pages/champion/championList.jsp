<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.labo.models.entities.Champion" %>
<%@ page import="com.example.labo.models.entities.Loading" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
  <link rel="stylesheet" href="styles/styleList.css">

  <title>Champion List</title>
</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add a Champion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="addChampion" method="post" style="width:95%; min-width: 300px;">
            <div class="form-group">
              <label class="form-label">Name :</label>
              <input type="text" class="form-control" name="username" placeholder="Nom" value="${name}"
                     id="username">
            </div>
            <div class="form-group">
              <label for="selectClass">Class :</label>
              <select class="form-select" name="Class" id="selectClass">
                <option value="CONTROLLER">CONTROLLER</option>
                <option value="FIGHTER">FIGHTER</option>
                <option value="MAGE">MAGE</option>
                <option value="MARKSMAN">MARKSMAN</option>
                <option value="SLAYER">SLAYER</option>
                <option value="TANK">TANK</option>
                <option value="SPECIALIST">SPECIALIST</option>
              </select>
            </div>
            <div class="form-group">
              <label for="selectRegion"> Region :</label>
              <select class="form-select" name="region" id="selectRegion">
                <option value="BANDE_CITY">BANDLE_CITY</option>
                <option value="DEMACIA">DEMACIA</option>
                <option value="FRELJORD">FRELJORD</option>
                <option value="IONIA">IONIA</option>
                <option value="IXTAL">IXTAL</option>
                <option value="MOUNT_TARGON">MOUNT_TARGON</option>
                <option value="NOXUS">NOXUS</option>
                <option value="PILTOVER">PILTOVER</option>
                <option value="BILGEWATER">BILGEWATER</option>
                <option value="SHADOW_ISLES">SHADOW_ISLES</option>
                <option value="SHURIMA">SHURIMA</option>
                <option value="VOID">VOID</option>
                <option value="ZAUN">ZAUN</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label">Date of Creation :</label>
              <input type="date" class="form-control" name="creationDate" id="creationDate">
            </div>
            <div>
              <button type="submit" class="btn btn-success" name="submit">Save</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="background"></div>

<%@ include file="../user/header.jsp" %>

<main id="main-content">


  <% List<Champion> champions = (List<Champion>) request.getAttribute("champion");%>

  <button type="button" class="btn btn-primary button-container btntranslu" data-toggle="modal"
          data-target="#exampleModal">
    Add
  </button>

  <section class="form-div">
    <table class="table">
      <thead class="thead-dark">
      <tr>
        <th>ID</th>
        <th>Icon</th>
        <th>Name</th>
        <th>ClassType</th>
        <th>Update</th>
        <th>Delete</th>

      </tr>
      </thead>

      <tbody>
      <%
        champions.sort(Comparator.comparing(Champion::getId));
        for (Champion champion : champions){
      %>
      <tr>
        <td><%= champion.getId()%>         </td>
        <td><%= champion.getIcon()%></td>

        <td><%= champion.getName()%>   </td>
<%--
        <td><%= champion.getAClassType()%>      </td>
--%>
        <td><%= champion.getCreationDate()%>       </td>

        <td>
          <form action="updateChampion" method="get">
            <button type="submit" class="btn btn-custom-update" name="upd" id="button-update">Update</button>
            <input type="text" name="id" value="<%= champion.getId() %>" hidden="hidden">
          </form>
        </td>
        <td>
          <form action="championList" method="post">
            <button type="submit" class="btn btn-custom-delete test-red" name="del" id="button-delete">Delete</button>
            <input type="text" name="id" value="<%= champion.getId()%>" hidden="hidden">
          </form>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </section>
</main>
<form action="addListChampion" method="post">
<button type="submit" class="btn btn-custom-delete test-red">ADD ALL CHAMPION</button>
</form>


<%--  BOOTSTRAP  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>