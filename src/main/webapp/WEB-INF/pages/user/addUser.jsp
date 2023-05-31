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
<%@ include file="header.jsp" %>

<main id="main-content">
    <div class="container">
        <div class="text-center mb-4">
            <h3>Add New User</h3>
            <p class="text-muted">Complete the form below to add a new user</p>
        </div>


        <div class="container d-flex justify-content-center">
            <form action="addUser" method="post" style="width:50vw; min-width: 300px;">
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">Username :</label>
                        <input type="text" class="form-control" name="username" placeholder="Pseudo" value="${username}"
                               id="username">
                    </div>

                    <div class="col">
                        <label class="form-label">Password :</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" id="password">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email :</label>
                        <input type="email" class="form-control" name="email" placeholder="Votre adresse email" id="email">
                    </div>
                    <div class="col">
                        <label for="selectRole"> Select Role</label>
                        <select class="form-select" name="role" id="selectRole">
                            <option value="ADMIN">ADMIN</option>
                            <option value="PLAYER">PLAYER</option>
                        </select>
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