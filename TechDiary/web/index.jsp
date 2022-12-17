<%-- 
    Document   : index
    
    Author     : Md. Talal Wasim
--%>

<%@page import="com.tech.diary.utility.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Diary</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--mycss-->
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--font awesome css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner_background{
               
                clip-path: polygon(50% 0%, 79% 0, 100% 0, 100% 100%, 80% 96%, 51% 100%, 20% 97%, 0 100%, 0 0, 18% 0);
                /*clip-path: polygon(50% 0%, 79% 0, 100% 0, 100% 100%, 80% 96%, 50% 81%, 20% 97%, 0 100%, 0 0, 18% 0);*/


            }

        </style>   
        

        <!-- customs css for this page -->
        <style type="text/css">
            .my-card {
                box-shadow: 0px 0px 10px 1px #0097A7;
                /*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
            }
        </style>
        <!-- end of customs css for this page -->
    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar_simple.jsp" %>


        <!--create banner-->
        <!--container-fluid-->
        <div class="container-fluid p-0 m-0"> 
            <div class="jumbotron bg-info text-white banner_background ">
                <div class="container">

                    <h3 class="display-4">Welcome to Tech Diary,</h3>
                    <p>Hey guys, welcome to the world of technology, this is the most popular technology related diary.
                        Hey guys, welcome to the world of technology, this is the most popular technology related diary.
                        Hey guys, welcome to the world of technology, this is the most popular technology related diary.
                        Hey guys, welcome to the world of technology, this is the most popular technology related diary.
                    </p>

                    <p>Hey guys, welcome to the world of technology, this is the most popular technology related diary.
                        Hey guys, welcome to the world of technology, this is the most popular technology related diary.</p>

                    <button class="btn btn-outline-light"><span class="fa fa-bell-o"></span> It's Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>

                </div>
            </div>

        </div>
        <!--end container-fluid -->


        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">

                    <div class="card my-card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card my-card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card my-card">
                        
                        <div class="card-body">
                            <h5 class="card-title">ASP .Net</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>





            </div>





            <div class="row mb-2">
                <div class="col-md-4">

                    <div class="card my-card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Ruby on Rails</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card my-card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Golang</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card my-card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Android</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>





            </div>
            <div class="row mb-2">
                <div class="col-md-4">

                    <div class="card my-card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Ruby on Rails</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card my-card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Golang</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card my-card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Android</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn my-primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>





            </div>







        </div>
        
        <!--<br>-->















        <!-- Link javaScript Section-->
        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <!-- footer -->
	<%@include file="footer.jsp"%>
	<!-- end footer -->
      
    </body>
</html>
