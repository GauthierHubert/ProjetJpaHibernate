<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.labo.models.entities.User" %>

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

    <title>Title</title>
</head>
<body>
<div class="background"></div>

<%@ include file="header.jsp" %>

    <main id="main-content">

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add a user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="addUser" method="post">
                            <div class="form-group">
                                <label class="form-label" for="username">Username :</label>
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="Pseudo"
                                       value="${username}">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="password">Password :</label>
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="*****">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="email">Email :</label>
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="exemple@exemple.com">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="email">Select Role</label>
                                <select class="form-select" name="role" id="selectRole">
                                    <option value="PLAYER">PLAYER</option>
                                    <option value="ADMIN">ADMIN</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="2exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="2exampleModalLabel">Add a user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="updateUser" method="post">
                            <div class="form-group">
                                <label class="form-label" for="2username">Username :</label>
                                <input type="text" class="form-control" id="2username" name="username"
                                       placeholder="Pseudo"
                                       value="">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="2password">Password :</label>
                                <input type="password" class="form-control" id="2password" name="password"
                                       placeholder="*****">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="2userEmail">Email :</label>
                                <input type="email" class="form-control" id="2userEmail" name="email"
                                       placeholder="exemple@exemple.com">
                            </div>
                            <div class="form-group">
                                <select class="form-select" name="role" id="2selectRole">
                                    <option value="${userRole}"></option>
                                    <option value="ADMIN">ADMIN</option>
                                    <option value="PLAYER">PLAYER</option>
                                </select>
                            </div>
                            <input type="hidden" name="id" id="userId" value="">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <% List<User> users = (List<User>) request.getAttribute("user");%>

        <section class="form-div">
            <button type="button" class="btn btn-primary button-container btntranslu" data-toggle="modal"
                    data-target="#exampleModal">
                Add
            </button>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                </thead>

                <tbody>
                <%
                    users.sort(Comparator.comparing(User::getId));
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId()%>
                    </td>
                    <td><%= user.getUsername()%>
                    </td>
                    <td><%= user.getEmail()%>
                    </td>
                    <td><%= user.getRole()%>
                    </td>
                    <td>
                        <button type="button" class="btn btn-custom-update" data-toggle="modal"
                                data-target="#2exampleModal" data-id="<%= user.getId() %>" data-role="<%= user.getRole()%>" data-name="<%=user.getUsername()%>" data-mail="<%= user.getEmail()%>">
                            Update
                        </button>
                    </td>
                    <td>
                        <form action="userList" method="post">
                            <button type="submit" class="btn btn-custom-delete test-red" name="del" id="button-delete">
                                Delete
                            </button>
                            <input type="text" name="id" value="<%= user.getId()%>" hidden="hidden">
                        </form>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>


        </section>
    </main>


<%--  BOOTSTRAP  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $(".btn-custom-update").click(function() {
            var userId = $(this).data("id");
            $("#userId").val(userId);
            var userRole = $(this).data("role");
            $("#2selectRole").val(userRole);
            var username= $(this).data("name");
            $("#2username").val(username);
            var userEmail = $(this).data("mail");
            $("#2userEmail").val(userEmail);
        });
    });
</script>
</body>
</html>
