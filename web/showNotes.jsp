<%-- 
    Document   : showNotes
    Created on : 18 Jun, 2021, 11:55:13 AM
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="Pojo_User_Details.Post"%>
<%@page import="DBConnection.DBConnect"%>
<%@page import="DAO.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    UserDetails user3 = (UserDetails)session.getAttribute("userD");
    if(user3==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error", "Please Login...");
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Entry</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <%
         String updateMsg = (String)session.getAttribute("updateMsg");
         if(updateMsg!=null){
             %>
             <div class="alert-success text-center" role="alert"><%=updateMsg%></div>
             <% 
                 session.removeAttribute("updateMsg");
             }
        %>
        
        <%
         String wrongMsg = (String)session.getAttribute("wrongMsg");
         if(wrongMsg!=null){
             %>
             <div class="alert-danger text-center" role="alert"><%=wrongMsg%></div>
             <% 
                 session.removeAttribute("wrongMsg");
             }
        %>
        
        <%
         String deleteMsg = (String)session.getAttribute("deleteMsg");
         if(deleteMsg!=null){
             %>
             <div class="alert-success text-center" role="alert"><%=deleteMsg%></div>
             <% 
                 session.removeAttribute("deleteMsg");
             }
        %>
        
        <div class="container">
            <h2 class="text-center">All Entries:</h2>
            
            
            
            <div class="row">
                <div class="col-md-12">
                    
                    <%
                      if(user3 != null){
                          PostDAO ob = new PostDAO(DBConnect.getConn());
                          List<Post> post = ob.getData(user3.getId());
                          System.out.println(post);
                          for(Post po : post){
                        
                    %>
                    
                    
                        <div class="card mt-3">
                        <img alt="" src="img/n3.jpg" class="card-img-top mt-2 mx-auto"  style="max-width: 100px">
                        <div class="card-body p-4">
                            
                            
                            <h5 class="card-title"><%= po.getTitle()%> </h5>
                            <p><%= po.getContent()%>.</p>
                            
                            <p>
                                <b class="text-success">Published By :<%=user3.getName()%> </b><br><b class="text-primary"></b>
                            </p>
                            
                            <p>
                                <b class="text-success">Published Date:<%= po.getPdate() %> </b><br><b class="text-success"></b>
                            </p>
                            
                            <div class="container text-center mt-2">
                                <a href="DeleteServlet?note_id=<%=po.getPostId()%>" class="btn btn-danger">Delete</a>
                                
                                
                                <a href="edit.jsp?note_id=<%=po.getPostId() %> " class="btn btn-primary">Edit</a>
                            </div>
                    </div>
                </div>
                        <%
                               }
                            }
                        %>
                   
            </div>
           </div>  
                               
        </div>
                         <%@include file="all_component/footer.jsp" %>
    </body>
</html>
