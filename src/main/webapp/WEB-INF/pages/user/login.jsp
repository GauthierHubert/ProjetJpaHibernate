
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <%--  BOOTSTRAP  --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


  <%--    Font Awesome    --%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="styles/styleLogin.css">

  <title>Title</title>
</head>
<body>

<!-- Navigation -->

<%@ include file="header.jsp" %>

<main>


  <div class="video-background">
    <video autoplay muted loop id="maVideo">
      <source src="images/index/teemo-boucle.mp4" type="video/mp4">
    </video>
  </div>


  <div class="login-container">
    <h1>Se connecter</h1>
    <form class="login-form" method="post" action="login">

      <c:if test="${loginError != null}"> <span class="error">${loginError}</span> </c:if>
      <div class="form-group">

        <input type="text" id="login" name="login" placeholder="Login" value="${login}">
      </div>
      <div class="form-group">

        <input type="password" id="password" name="password" placeholder="Mot de passe">
      </div>

      <button type="submit" class="">Connect</button>

    </form>
  </div>
</main>




</body>
</html>

