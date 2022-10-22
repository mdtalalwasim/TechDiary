<%-- 
    Document   : user_profile
    Created on : Oct 14, 2022, 11:56:54 PM
    Author     : Md. Talal Wasim
--%>

<%@page import="com.tech.diary.data.model.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    //check is session has attribute of currentUser? Is any current user is present in session
    User user = (User) session.getAttribute("currentUser"); //type casting to User object

    //if not...
    if (user == null) {
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

        <!--navbar-->

        <!--start navbar -->

        <nav class="navbar navbar-expand-lg navbar-dark  my-primary-background ">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-laptop"></span> Tech Diary</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-rocket"></span> Trend <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-book"></span>    Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Projects</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Algorithms & Data Structure</a>
                        </div>
                    </li>
                    <!--            <li class="nav-item">
                                    <a class="nav-link " href="#">More...</a>
                                </li>-->

                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact</a>
                    </li>

                    

                </ul>
                
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-user-circle"></span> <%= user.getUserName() %></a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle-o "></span> Logout</a>
                    </li>
                </ul>
                
            </div>
        </nav>



        <!--end navbar-->
        


        <!--end of navbar-->






        <%= user.getUserName()%>
        <br>
        <%= user.getUserEmail()%>
        <br>
        <%= user.getUserAbout()%>
        <br>
        <%= user.getUserProfile()%>
        <br>
        <%= user.getDateTime()%>










        <!-- Link javaScript Section-->
        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


        <!-- Link javaScript Section-->

    </body>
</html>
