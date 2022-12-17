<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--mycss-->
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--font awesome css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <title>404 Error!!! Sorry Page not found!</title>

    </head>
    <body>

        <!--start navbar code-->



        <!--start navbar -->

        <nav class="navbar navbar-expand-lg navbar-dark  my-primary-background ">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-laptop"></span> Tech Diary</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>

<!--                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-book"></span>    Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Projects</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Algorithms & Data Structure</a>
                        </div>
                    </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#">More...</a>
                                </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="#"><span class="fa fa-address-book-o"></span> Contact</a>
                    </li>-->

                    <li class="nav-item">
                        <a class="nav-link active" href="login_page.jsp"><span class="fa fa-user-circle-o "></span> Login</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="registration_page.jsp"><span class="fa fa-user-plus "></span> Register</a>
                    </li>


                </ul>
                <!--                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                                </form>-->
            </div>
        </nav>



        <!--end navbar-->





        <!--End navbar code-->

        <div class="container p-3 text-center" >
            <img src="img/404.png" class="img-fluid" width="400px;" height="300px;" alt="alt"/> 
            <h1 class="display-4">404 Error!!! Sorry Page not found!</h1>
            <p>Sorry, an error has occurred! That requested page can’t be found.

                It looks like nothing was found at this location.</p>
                        <!--<p style="color: red"><%= exception%></p>-->
            <a><a href="index.jsp" class="btn btn-outline-primary">Home</a>

        </div>

        <!-- footer -->
        <%@include file="footer.jsp"%>
        <!-- end footer -->
    </body>
</html>
