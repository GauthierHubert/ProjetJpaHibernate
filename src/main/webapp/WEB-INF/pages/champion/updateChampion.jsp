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


  <title>Update User</title>
</head>
<body>

<%@ include file="../user/header.jsp" %>

<div class="container">
  <div class="text-center mb-4">
    <h3>Update User</h3>
    <p class="text-muted">Complete the form below to update the champion</p>
  </div>


  <div class="container d-flex justify-content-center">
    <form action="updateChampion" method="post" style="width:50vw; min-width: 300px;">
      <div class="row mb-3">
        <div class="col">
          <label for="name" class="form-label">Name :</label>
          <input type="text" class="form-control" name="name" placeholder="Nom" value="${name}"
                 id="name">
        </div>

        <div class="col">
          <label for="icon" class="form-label">Icone :</label>
          <input type="file" class="form-control" name="icon" id="icon" accept="image/png , image/jpg , image/jpeg">
        </div>

        <div class="mb-3">
          <label for="selectClass">Class :</label>
          <select class="form-select" name="Class" id="selectClass">
            <option value="CONTROLLER">Controller</option>
            <option value="FIGHTER">Fighter</option>
            <option value="MAGE">Mage</option>
            <option value="MARKSMAN">Marksman</option>
            <option value="SLAYER">Slayer</option>
            <option value="TANK">Tank</option>
            <option value="SPECIALIST">Specialist</option>
          </select>
        </div>
        <div class="col">
          <label for="selectRegion"> Region :</label>
          <select class="form-select" name="region" id="selectRegion">
            <option value="BANDE_CITY">Bandle City</option>
            <option value="DEMACIA">Demacia</option>
            <option value="FRELJORD">Frejlord</option>
            <option value="IONIA">Ionia</option>
            <option value="IXTAL">Ixtal</option>
            <option value="MOUNT_TARGON">Mount Targon</option>
            <option value="NOXUS">Noxus</option>
            <option value="PILTOVER">Piltover</option>
            <option value="BILGEWATER">Bilgewater</option>
            <option value="SHADOW_ISLES">Shadow Isles</option>
            <option value="SHURIMA">Shurima</option>
            <option value="VOID">Void</option>
            <option value="ZAUN">Zaun</option>
          </select>
        </div>
        <div class="col">
          <label for="creationDate" class="form-label">CreationDate :</label>
          <input type="date" class="form-control" name="creationDate" id="creationDate">
        </div>


        <div>
          <button type="submit" class="btn btn-success" name="submit">Save</button>
          <a href="index.jsp" class="btn btn-danger">Cancel</a>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
</html>