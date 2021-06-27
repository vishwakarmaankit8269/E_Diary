<%-- 
    Document   : edit
    Created on : 19 Jun, 2021, 12:50:27 PM
    Author     : HP
--%>

<%@page import="Pojo_User_Details.Post"%>
<%@page import="DBConnection.DBConnect"%>
<%@page import="DAO.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserDetails user1 = (UserDetails)session.getAttribute("userD");
    if(user1==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error", "Please Login...");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
         <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        
        <% 
        Integer noteid = Integer.parseInt(request.getParameter("note_id"));
        PostDAO post =new PostDAO(DBConnect.getConn());
        Post p = post.getDatabyId(noteid);

        %>
        
          <div class="container-fluid">
            <%@include file="all_component/navbar.jsp" %>
            <h1 class="text-center">Edit your Entry </h1>
        </div>
        <div class="container">
             <div class="row">
            <div class="col-md-12">
                <form action="NoteEditServlet" method="post">
                    
                    <input type="hidden" value="<%= noteid%>" name="noteid">
                    
                     <div class="form-group">
                         
                         
                         
                        <label for="exampleInputEmail1">Enter Title</label>
                             <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" name="title" required="required"> <%--value="<%=p.getTitle()%>"--%>
    
                     </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Enter Content</label>
                        <textarea rows="9" cols="12" class="form-control" name="content" required="required" ></textarea>  <%-- <%=p.getContent()%>--%>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Add Entry</button>
                    </div>
                </form>
            </div>
        </div>
        </div>
            <%@include file="all_component/footer.jsp" %>
    </body>
</html>
