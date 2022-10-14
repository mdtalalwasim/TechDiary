<%-- 
    Document   : user_profile
    Created on : Oct 14, 2022, 11:56:54 PM
    Author     : Md. Talal Wasim
--%>

<%@page import="com.tech.diary.data.model.User"%>
<%@page errorPage="error_page.jsp" %>
<% 
    //check is session has attribute of currentUser? Is any current user is present in session
    User user = (User)session.getAttribute("currentUser");
    
    //if not...
    if (user==null) {
            //mean no one login...
            //then send to login page...for login.
            response.sendRedirect("login_page.jsp");
        }
        
       //else [user present] then... below code will execute...

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>
    </head>
    <body>
        <%= user.getUserName()  %>
        <br>
        <%= user.getUserEmail() %>
        <br>
        <%= user.getUserAbout() %>
        <br>
        <%= user.getUserProfile()%>
        <br>
        <%= user.getDateTime() %>
    </body>
</html>
