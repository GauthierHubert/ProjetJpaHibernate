<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <%--  BOOTSTRAP  --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


  <%--    Font Awesome    --%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>

  <link rel="stylesheet" href="styles/styleAdUser.css">


  <title>JSP</title>
</head>
<body>

<!-- Navigation -->
<%@ include file="../user/header.jsp" %>

<main id="main-content">
  <div class="container">
    <div class="text-center mb-4">
      <h3>Add New User</h3>
      <p class="text-muted">Complete the form below to add a new user</p>
    </div>


    <div class="container d-flex justify-content-center">
      <form action="addChampion" method="post" style="width:50vw; min-width: 300px;">
        <div class="row mb-3">
          <div class="col">
            <label class="form-label">Username :</label>
            <input type="text" class="form-control" name="username" placeholder="Nom" value="${name}"
                   id="username">
          </div>

          <div class="col">
            <label class="form-label">Icone :</label>
            <input type="file" class="form-control" name="icon" id="icon" accept="image/png , image/jpg , image/jpeg">
          </div>

          <div class="mb-3">
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
          <div class="col">
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
          <div class="col">
            <label class="form-label">CreationDate :</label>
            <input type="file" class="form-control" name="icon" id="icon" accept="image/png , image/jpg , image/jpeg">
          </div>


          <div>
            <button type="submit" class="btn btn-success" name="submit">Save</button>
            <a href="index.jsp" class="btn btn-danger">Cancel</a>
          </div>

        </div>
      </form>
    </div>
  </div>
</main>


<%--  BOOTSTRAP  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>