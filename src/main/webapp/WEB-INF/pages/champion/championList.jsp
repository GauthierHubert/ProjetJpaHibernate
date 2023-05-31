<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.labo.models.entities.Champion" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--  BOOTSTRAP  -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

  <!--  Font Awesome  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="styles/styleList.css">

  <title>Champion List</title>
</head>
<body>


<div class="background"></div>

<%@ include file="../user/header.jsp" %>

<main id="main-content">


  <% List<Champion> champions = (List<Champion>) request.getAttribute("champion");%>


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
        <td><%= champion.getStringIcon()%>         </td>
        <td><%= champion.getName()%>   </td>
        <td><%= champion.getAClassType()%>      </td>
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

<%--  BOOTSTRAP  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>