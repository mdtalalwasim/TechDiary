<%-- 
    Document   : show_post_details.jsp
    Created on : Nov 8, 2022, 12:45:50 AM
    Author     : Md. Talal Wasim
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.diary.data.model.Category"%>
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

<!--receive post_id which is coming from load_all_posts.jsp page...-->
<%    int postID = Integer.parseInt(request.getParameter("post_id")); //here "post_id" is coming from url rewriting of load_all_post.jsp page 

    PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());

    Post post = postDAO.getPostByPostID(postID);


%>


<%@page import="com.tech.diary.data.model.User"%>
<%@page import="com.tech.diary.dao.PostDAO"%>
<%@page import="com.tech.diary.utility.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.diary.data.model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getPostTitle()%>| Tech Diary</title>

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
        <!--start navbar -->

        <nav class="navbar navbar-expand-lg navbar-dark  my-primary-background ">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-laptop"></span> Tech Diary</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="user_profile.jsp"><span class="fa fa-rocket"></span> My TechDiary<span class="sr-only">(current)</span></a>
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
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-model"><span class="fa fa-vcard-o"></span> Create Post</a>
                    </li>



                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#userProfile-modal"><span class="fa fa-user-circle"></span> <%= user.getUserName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle-o "></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>

        <!--end of navbar-->


        <!--main contents of the body of this show_post_details.jsp page-->

        <div class="container">
            <div class="row mt-4">

                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header my-primary-background text-white">
                            <h4><%= post.getPostTitle()%></h4>
                        </div>  
                        <div class="card-body">
                            <img class="card-img-top my-3" src="blog_pics/<%= post.getPostPic() %>" alt="Card image cap"/>
                            <p><%= post.getPostContent()%></p>

                            <br>

                            <pre>
                                <%= post.getPostCode()%>
                            </pre>
                            
                            
                            
                        </div>  

                        <div class="card-footer my-primary-background text-center">
                            <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-thumbs-o-up"></i><span>10</span></a>                
                            
                            <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-commenting-o"></i><span>20</span></a>                

                        </div>    





                    </div>
                </div>

            </div>

        </div>



        <!--end of main contents of the body of this show_post_details.jsp page-->



        <!--user profile modal / user profile info box-->

        <!-- Modal -->
        <div class="modal fade" id="userProfile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header my-primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">My Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <img src="pics/<%= user.getUserProfile()%>" class="img-fluid" style="border-radius: 50%" height="150px" width="150px"/>
                            <h5 class="modal-title" id="exampleModalLabel"><%= user.getUserName()%></h5>

                            <!--User Details-->
                            <div id="profileDetails">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getUserId()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getUserEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getUserGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About :</th>
                                            <td><%= user.getUserAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registration Date :</th>
                                            <td><%= user.getDateTime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--End of User Details-->

                            <!--User Profile Edit section-->
                            <div id="profileEdit" style="display:none;">
                                <h3 class="mt-2">Edit Your Profile Information</h3>

                                <form action="UserProfileEditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getUserId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" name="user_email" value="<%= user.getUserEmail()%>" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" name="user_name" value="<%= user.getUserName()%>" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="text" name="user_password" value="<%= user.getUserPassword()%>" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getUserGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td><textarea name="user_about" class="form-control"><%= user.getUserAbout()%></textarea> </td>
                                        </tr>
                                        <tr>
                                            <td>Change Photo:</td>
                                            <td><input type="file" name="user_profileImage" class="form-control" required></td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>

                                    </div>

                                </form>



                            </div>

                            <!--End of User Profile Edit section-->

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-userProfile-btn" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>



        <!--End of user profile modal / user profile info box-->


        <!--add Create Post Modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header my-primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="create-post-form-id" action="CreatePostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="catId">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        //categories print/show in create post modal
                                        PostDAO postdao = new PostDAO(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postdao.getAllCategories();

                                        for (Category c : list) {

                                    %>
                                    <option value="<%= c.getCategoriesId()%>"><%= c.getCategoriesName()%> </option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" name="post_title" placeholder="Enter post Title" class="form-control" required />
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="post_content" rows="5" cols="10" placeholder="Enter your content" ></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="post_code" rows="5" cols="10" placeholder="Enter your code (if any)" ></textarea>
                            </div>

                            <div class="form-group">
                                <label>Select photo for your post</label>
                                <input type="file" class="form-control" name="post_pic" />
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-info">Post</button>
                            </div>


                        </form>

                    </div>

                </div>
            </div>
        </div>


        <!--End of add Post Modal -->




        <!-- Link javaScript Section-->
        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--for sweet alert-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--end for sweet aleart-->

        <script src="js/myjs.js" type="text/javascript"></script>

        <!--script for user profile section edit button toggle-->
        <script>
            $(document).ready(function () {

                let editStatusOfUserProfile = false;//by default we assumet it false.

                //toggle code for user profile edit
                $("#edit-userProfile-btn").click(function () {
//                   alert("Edit button Clicked!");
                    if (editStatusOfUserProfile == false) {
                        $("#profileDetails").hide();
                        $("#profileEdit").show();
                        editStatusOfUserProfile = true;
                        $(this).text("Back");
                    } else {
                        $("#profileDetails").show();
                        $("#profileEdit").hide();
                        editStatusOfUserProfile = false;
                        $(this).text("EDIT");
                    }

                });
                //end of toggle code for user profile edit
            });
        </script>
        <!--end ofscript for user profile section edit button toggle-->

        <!-- Link javaScript Section-->

        <!--create post js code-->
        <script>
            $(document).ready(function (e) {

                //alert("loaded create post.....");
                $("#create-post-form-id").on("submit", function (event) {
                    //the below code is run when form is submited

                    //normal behaviour of form 'means Synchronous way to submit" 
                    //+ other normal behavior is stopped for this line.
                    event.preventDefault();
                    console.log("Post button clicked...");

                    let form = new FormData(this);

                    //now requesting to server...
                    $.ajax({

                        url: "CreatePostServlet",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {
                            //success...
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Save Successfully", "success");
                            } else {
                                swal("Error!", "Something went wrong, try again!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error...
                            swal("Error!", "Something went wrong, try again!", "error");


                        },
                        processData: false, //if form consist pic for sending to server, then this line must; 
                        contentType: false//if form consist pic for sending to server, then this line must;

                    });
                });
            });

        </script>

        <!--end of create post js code-->



    </body>
</html>
