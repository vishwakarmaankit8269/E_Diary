<%-- 
    Document   : register
    Created on : 15 Jun, 2021, 11:32:17 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <%@include file="all_component/allcss.jsp" %>
        
         
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid div-color">
            <div class="col-md-4 offset-md-4">
                <div class="card mt-1">
                    <div class="card-header text-center text-white bg-custom" style="background-color: #8e24aa;">
                        <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                        <h4>Registration</h4>
                    </div>
                    
                    <% 
                       String regMsg = (String)session.getAttribute("reg-success");
                       if(regMsg!=null)
                       {%>
                          <!--swal("Good job!", "You have successfully registered!", "success");-->  
                            <div class="alert alert-success" role="alert">
                                Registered Successfully!.. <a href="login.jsp"> Click Here to login</a> 
                            </div>
                      <% }
                      session.removeAttribute("reg-success");
                      %>
                      
                        <% 
                       String failedMsg = (String)session.getAttribute("failed-msg");
                       if(failedMsg!=null)
                       {%>
                          <!--swal("Oops!", "Something went wrong!", "error");-->  
                            <div class="alert alert-danger" role="alert">
                                Something went wrong! <a href="register.jsp">try again</a>
                            </div>
                      <% }
                       session.removeAttribute("failed-msg");
                      %>
                      
                    <div class="card-body">
                        
                        <form action="UserServlet" method="post">
                            
                            <div class="form-group">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Nmae" name="fname">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="email1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="uemail">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="password1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="upassword">
                            </div>
                            
                            <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                        </form>
                    </div>
                    
                </div>
                
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
    </body>

