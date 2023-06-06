<%--
  Created by IntelliJ IDEA.
  User: studentdev05
  Date: 10-05-23
  Time: 09:45
  To change this template use File | Settings | File Templates.
--%>
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


  <title>Title</title>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
  <div class="text-center mb-4">
    <h3>Update User</h3>
    <p class="text-muted">Complete the form below to update a user</p>
  </div>


  <div class="container d-flex justify-content-center">
    <form action="updateUser" method="post" style="width:50vw; min-width: 300px;">
      <div class="row mb-3">
        <div class="col">
          <label class="form-label">Username :</label>
          <input type="text" class="form-control" name="username" placeholder="login"  id="username" value="${username}">
        </div>
        <div class="col">
          <label class="form-label">Password :</label>
          <input type="password" class="form-control" name="password" placeholder="********" id="password" value="">
          <input type="text" name="USER_ID" value="" hidden="hidden">
        </div>
        <div class="col">
          <label for="selectRole"> Select Role</label>
          <select class="form-select" name="role" id="selectRole">
            <option value="${role}">${role}</option>
            <% if(session.getAttribute("role").equals("PLAYER")) { %>
            <option value="ADMIN">ADMIN</option>
            <% }else { %>
            <option value="PLAYER">PLAYER</option>
            <% } %>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label">Email :</label>
          <input type="email" class="form-control" name="email" placeholder="zirka@ryan.com" id="email" value="${email}">
        </div>

        <div>
          <button type="submit" class="btn btn-success" name="submit">Save</button>
          <a href="userList" class="btn btn-danger">Cancel</a>
        </div>

      </div>
    </form>
  </div>
</div>

</body>
</html>