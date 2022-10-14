<%-- 
    Document   : error_page
    Created on : Oct 14, 2022, 8:21:01 PM
    Author     : Md. Talal Wasim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error!</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--mycss-->
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--font awesome css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner_background{
               clip-path: polygon(50% 0%, 79% 0, 100% 0, 100% 100%, 80% 96%, 51% 100%, 20% 97%, 0 100%, 0 0, 18% 0);
               
            
            } 
            
        </style>
        
        
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid" alt="error"/>
            <h3 class="display-4">Sorry! Something went wrong!!!</h3>
            <%= exception %> <!--for print the exception-->
            <a href="index.jsp" class="btn my-primary-background text-white mt-2">Home</a>
        </div>
    </body>
</html>