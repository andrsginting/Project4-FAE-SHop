<%-- 
    Document   : list
    Created on : Jul 13, 2022, 4:01:48 PM
    Author     : Andreas PC
--%>

<%@page import="java.util.List"%>
<%@page import="crud.lists"%>
<%@page import="Connection.ConnectionDb"%>
<%@page import="crud.listDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
 <%
    //listDao listData = new listDao(ConnectionDb.getCon());
   // List<lists> list = listData.getAlllists();
    //request.setAttribute("BOOKS_LIST", list);
%> 
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <title>CRUD Application</title>

        <style>
            .inner{
                margin: 15px 0;
            }
        </style>
    </head>
    <body>
        <div  class="container-fluid">
            <nav class="navbar navbar-light">
                <a class="navbar-brand">FAE Shop</a>
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </nav>
        </div>
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-md-3">
                        <h3>Input Your Information</h3>
                        <form action="AddListServlet" method="post">
                            <div class="form-group">
                                <label>Full Name</label>
                                <input class="form-control" name="lName" place-holder="Name" required>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <select id="inputState" class="form-control" name="lGender" required>
                                    <option selected disabled>--SELECT--</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" name="lEmail" place-holder="Email" required>
                            </div>
                            <div class="form-group" >
                            <label>Address</label>
                                <input class="form-control" name="lAddress" place-holder="Address" required>    
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-primary">Reset</button>
                        </form>
                    </div>
                <div class="col-md-9">
                        <h3>User Information From Database</h3>
                        <table class="table">
                            <thead class="bg-light">
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tempList" items="${LISTS_LIST}">
                                    <tr>
                                        <td>${tempList.listName }</td>
                                        <td>${tempList.listGender }</td>
                                        <td>${tempList.listEmail }</td>
                                        <td>${tempList.listAddress}</td>
                                        <td><a href="editbook.jsp?id=${tempList.id }">Edit</a> 
                                            <a href="DeleteBookServlet?id=${tempList.id}">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
<!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
