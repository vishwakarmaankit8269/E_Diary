

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
        <title>Add Entry</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="all_component/navbar.jsp" %>
            <h1 class="text-center">Add your Entry </h1>
        </div>
        <div class="container">
             <div class="row">
            <div class="col-md-12">
                <form action="AddNotesServlet" method="post">
                     <div class="form-group">
                         
                         <%
                             UserDetails us = (UserDetails)session.getAttribute("userD");
                             if(us!=null){
                                 %>
                                 <input type="hidden" value="<%=us.getId()%>" name="uid">
                            <% }
                         %>
                         
                        <label for="exampleInputEmail1">Enter Title</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" name="title" required="required">
    
                     </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Enter Content</label>
                        <textarea rows="10" cols="" class="form-control" name="content" required="required"></textarea>
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
