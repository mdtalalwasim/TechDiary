<%-- 
    Document   : login_page
    Created on : Oct 11, 2022, 4:42:45 PM
    Author     : Md. Talal Wasim
--%>

<%@page import="com.tech.diary.data.model.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--mycss-->
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--font awesome css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner_background{
                /*clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 78% 95%, 50% 100%, 21% 94%, 0 100%, 0% 35%, 0 0);*/
                /*clip-path: polygon(50% 0%, 100% 0, 100% 44%, 100% 70%, 100% 100%, 71% 96%, 0 100%, 0 66%, 0 28%, 0 0);*/
                /*clip-path: polygon(50% 0%, 85% 0, 100% 0, 100% 100%, 80% 98%, 45% 100%, 20% 98%, 0 100%, 0 0, 18% 0);*/
                clip-path: polygon(50% 0%, 79% 0, 100% 0, 100% 100%, 80% 96%, 51% 100%, 20% 97%, 0 100%, 0 0, 18% 0);
                /*clip-path: polygon(50% 0%, 79% 0, 100% 0, 100% 100%, 80% 96%, 50% 81%, 20% 97%, 0 100%, 0 0, 18% 0);*/


            }

        </style>


    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar_simple.jsp" %>


        <!--login form-->
        <main class="d-flex align-items-center my-primary-background banner_background " style="height: 75vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">

                            <div class="card-header text-center my-primary-background text-white">
                                <!--<br>-->
                                <span class="fa fa-group fa-2x "></span>
                                <br>
                                <p>Login here</p>

                            </div>

                            <!--Starting of Message-->
                            <%
                                //part of java code... so use  scriptlet tag 
                                Message message = (Message) session.getAttribute("msg");

                                if (message != null) {
                            %>

                            <!--HTML Code-->
                            <!--showing error login msg-->

                            <div class="alert <%= message.getCssClass()%>" role="alert">
                                <%= message.getContent()%>
                            </div>

                            <!--showing error login msg-->

                            <%
                                    //this is part of java code...
                                    //need to remove msg from session...for msg not showing again and again. just showing msg for one time.
                                    //after page refresh(session end) msg will disappear again.
                                    session.removeAttribute("msg");
                                }


                            %>
                            <!--End of Message-->

                            <div class="card-body">
                                <!-- start login form-->
                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" type="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <!--                                    <div class="form-check">
                                                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                                                        </div>-->
                                    <button type="submit" class="btn my-primary-background text-white mt-2">Submit</button>

                                </form>
                                <!-- end login form-->
                            </div>
                            <div class="">

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </main>











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
