<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <!--  BOOTSTRAP  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!--  Font Awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--  Custom CSS  -->
    <link rel="stylesheet" href="styles/styleIndex.css">


    <title>JSP</title>
</head>
<body>
<!-- Navigation -->

<%@ include file="WEB-INF/pages/user/header.jsp" %>

<!-- Page Content -->

    <main>
        <div class="video-background">
            <video autoplay muted loop id="maVideo">
                <source src="images/index/teemo-boucle.mp4" type="video/mp4">
            </video>
        </div>
    </main>


<%--  BOOTSTRAP  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>