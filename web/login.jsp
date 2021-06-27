<%-- 
    Document   : login
    Created on : 14 Jun, 2021, 3:00:03 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file = "all_component/allcss.jsp"%>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid div-color">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-header text-center text-white bg-custom" style="background-color: #8e24aa;">
                        <i class="fa fa-user fa-3x" aria-hidden="true"></i>
                        <h4>Login</h4>
                    </div>
                    
                    <% 
                        String InvalidMsg=(String)session.getAttribute("login-failed");
                        if(InvalidMsg!=null)
                        {%>
                         <div class="alert alert-danger" role="alert">
                                Invalid Username or password <a href="login.jsp">try again</a>
                            </div>
                        <% 
                        session.removeAttribute("login-failed");
                        }
                        %>
                        <% 
                        String withoutLogin = (String)session.getAttribute("Login-error");
                        if(withoutLogin !=null){
                            %>
                            <div class="alert alert-danger" role="alert">
                                
                                <%=withoutLogin %>
                            </div>
                            <%  
                            session.removeAttribute("Login-error");
                            
                            }
                        %>
                        <% 
                        String logoutMsg = (String)session.getAttribute("logoutMsg");
                        if(logoutMsg != null)
                                {
                            %>
                             <div class="alert alert-success" role="alert">
                                
                                <%=logoutMsg %>
                            </div>
                            
                            <% 
                            session.removeAttribute("logoutMsg");
                            }
                        %>
                    <div class="card-body">
                        
                        <form action="LoginServlet" method="post">
                            
                            <div class="form-group">
                                <label for="email1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="uemail">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="password1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="upassword">
                            </div>
                            
                            <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
                        </form>
                    </div>
                    
                </div>
                
            </div>
        </div>
       <div class="container-fluid bg-dark mt-1">
    <p class ="text-center text-white">please contact with me if myself has any query</p>
    <p class ="text-center text-white">All rights reserved @ Ankit bhai 2021</p>
</div>
        
    </body>
</html>
