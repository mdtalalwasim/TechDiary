

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>

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

        <!--main content of this page-->
        <main class="my-primary-background banner_background p-5">
            <div class="container">
                <div class="col-md-6 offset-md-3 ">
                    <div class="card ">

                        <div class="card-header text-center my-primary-background text-white"><span class="fa fa-user-plus fa-2x"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body ">

                            <!-- start Register form-->
                            <form id="my-registration-form" action="UserRegisterServlet" method="POST">


                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="user_gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="user_gender" name="user_gender" value="male">Male
                                    <input type="radio" id="user_gender" name="user_gender" value="female">Female
                                </div>

                                <div class="form-group">
                                    <label for="about">About Yourself</label>
                                    <textarea class="form-control" name="user_about" placeholder="Describe yourself !"></textarea>
                                </div>

                                <div class="form-check">
                                    <input type="checkbox" name="user_check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none"> 
                                    <span class="fa fa-refresh fa-spin fa-3x "></span> <!--refresh button-->
                                    <h4>Please wait...</h4>
                                </div>

                                <button id="mysubmit-btn" type="submit" class="btn my-primary-background text-white mt-2">Submit</button>

                            </form>
                            <!-- end Register form-->


                        </div>
                        <!--                        <div class="card-footer">
                        
                                                </div>-->


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

        <!--for sweet alert-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--end for sweet aleart-->




        <!-- for AJAX -->
        <script>
            //for showing output messges as (ajax based) ...
            $(document).ready(function () {
                console.log("loaded.........");

                //when this "my-registration-form" form ->will "submit' the below function will call...
                $('#my-registration-form').on('submit', function (event) {
                    // when form will submit call this funtion...and execute the below code...
                    event.preventDefault();//the submitted data of 'registraion_page' through form will stop going to the servlet page

                    //from here all the data submitted to Servlet... 
                    let form = new FormData(this); //(this means my-registration-form) all data of form store in 'form' variable.


                    //for loader: loader will use just before submit the data into servlet
                    $("#mysubmit-btn").hide(); //hide submit button
                    $("#loader").show();//loader is show

                    //now send data to 'UserRegisterServlet': (our servlet page for User Register)
                    $.ajax({
                        url: "UserRegisterServlet", //url: where to submit data
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            //for loader: when success:
                            $("#mysubmit-btn").show(); //show submit button
                            $("#loader").hide();//loader is hide


                            //checking data....
                            if (data.trim() === 'done') {//this 'done' msg comes from servlet page if data inserted successfully

                                //sweet alert
                                swal("Successfully registered...we are redirecting to login page.")
                                        .then((value) => {
                                            //swal(`The returned value is: ${value}`);
                                            window.location = "login_page.jsp";
                                        });

                            } else {
                                swal(data);

                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR); //if any error occurred

                            //for loader: when any error occurred:
                            $("#mysubmit-btn").show(); //show submit button
                            $("#loader").hide();//loader is hide

                            //sweet alert
                            swal("Error! Please try again.")


                        },
                        processData: false, //no need to process any data
                        contentType: false  //no need to specify any contentType

                    }); //end $.ajax()



                }); //$('#my-registration-form').on('submit', function (event)
            });  //end $(document).redy(function () {})

        </script>



    </body>
</html>
