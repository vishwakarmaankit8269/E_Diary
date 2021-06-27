<%-- 
    Document   : home
    Created on : 16 Jun, 2021, 2:03:11 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserDetails user2 = (UserDetails)session.getAttribute("userD");
    if(user2==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error", "Please Login...");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid text-center">
            <div class="card py-5">
                <div class="card-body">
                    <img alt="" src="img/n3.jpg" class="img-fluid mx-auto" style="width: 350px;height: 500px">
                    <h1>START WRITING YOUR ENTRY </h1>
                    <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
                </div>
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
