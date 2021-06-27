<%-- 
    Document   : index
    Created on : 15 Jun, 2021, 11:31:04 PM
    Author     : HP
--%>

<%@page import="java.sql.Connection"%>
<%@page import="DBConnection.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <style type="text/css">
        .back-img{
        background:url("img/n2.jpg");
        width:100%;
        height: 90vh;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }
        
    </style>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <%@include file = "all_component/allcss.jsp" %>
       
</head>
<body>
         <%@include file ="all_component/navbar.jsp" %>
        
         
         <div class = "container-fluid back-img">
             <div class="text-center">
             <h1 class="text-white mr-auto"><i class="fa fa-book" aria-hidden="true"></i> E-Notes just save your Notes</h1>
            <a href="login.jsp" class="btn btn-light"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
            <a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
             </div>
         </div>
         
         <%@include file ="all_component/footer.jsp" %> 
</body>

