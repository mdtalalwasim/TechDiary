<%-- 
    Document   : user_profile
    Created on : Oct 14, 2022, 11:56:54 PM
    Author     : Md. Talal Wasim
--%>

<%@page import="com.tech.diary.data.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.diary.utility.helper.ConnectionProvider"%>
<%@page import="com.tech.diary.dao.PostDAO"%>
<%@page import="com.tech.diary.data.model.Message"%>
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
            
            
             /*bg pic*/
            body{
                background: url(pics/bgp.jpg);
                background-size: cover;
                background-attachment: fixed;
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


        <!-- main body of this page -->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        
                        <!--show categories in user profile main page-->
                        
                        <div class="list-group">
                            <!--get all categories list form database-->
                            <a href="#" onclick="getPosts(0,this)" class="selectedActiveCategoryLinkColorBlue list-group-item list-group-item-action active">All Post</a> <!--[active] attribute in class="... active" means this is selected and selected category color will be blue, if we remove 'active' attribute from this line, then blue color selected will disappear-->
                            <!-- getPosts(0,this) here this is the reference of which link/category or category Name you actually clicked [for keep tracking which link you clicked] -->
                            
                            <!-- to get "active" link in categories we declare a class="selectedActiveCategoryLinkColorBlue"  -->
                            <%  
                                //categories print/show in User Profile main dashboard or page
                                PostDAO objPostDAO = new PostDAO(ConnectionProvider.getConnection());
                                ArrayList<Category> catList = objPostDAO.getAllCategories();
                                
                                for (Category c : catList) {
 
                            %>
                            <a href="#" onclick="getPosts(<%= c.getCategoriesId() %>,this)" class="selectedActiveCategoryLinkColorBlue list-group-item list-group-item-action"><%= c.getCategoriesName() %></a>
                            <!-- getPosts( ,this) here this is the reference of which link/category or category Name you actually clicked [for keep tracking which link you clicked] -->
                            <%
                                }
                            %>

                            
                        </div> 


                    </div>
                    <!-- End show categories in user profile main page-->

                    <!--2nd col-->
                    <div class="col-md-8">
                        <!--show All post-->
                        
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">loading...</h3>
                            
                        </div>
                        
                        <div class="container-fluid" id="load-all-post-container">
                            <!--"load_all_posts.jsp" page contents will show here-->
                        </div>
                        



                    </div>

                </div>

            </div>

        </main>

        <!-- end main body of this page -->


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
        
        
        <!--load all post-->
        <script>
            function getPosts(categoryId, refVariableOFClickedLink){ //"refVariableOFClickedLink" this is reference or variable of which link you clicked or which link is active or selected[show in bule color].
                
                //show loader before ajax request, means when click on categories for showing post "loader is visible."
                $("#loader").show();
                $("#load-all-post-container").hide();
                $(".selectedActiveCategoryLinkColorBlue").removeClass("active");//remove active link[selected category] from categories list or category name
                //["active" / blue color selected link will remove when this line of code executed]
                
                
                $.ajax({
                   url:"load_all_posts.jsp",
                   data: {catId:categoryId}, //key:value -> here, catId go to server end. [this key -> "catId" will go to "load_all_posts.jsp" page]
                   //if catId=0 then fetch all category Post, if catId>0 then fetch "catId"(#number) category post
                   success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#load-all-post-container").show();
                        $("#load-all-post-container").html(data);//show the post contailer and put all dynamic data also 
                        $(refVariableOFClickedLink).addClass("active"); //put or add "active" class mark[which is blue color] in selected category or selected link
                        //clicked link or selected link/category  reference is now in "rerefVariableOFClickedLink" variable
                    }
            
               });
                
            }
            
            
            $(document).ready(function (e){
               
               //alert("loading all post"); 
               //when document will ready this function will call automatically.
               
               let allPostSelectedLinkBlueColorRef = $(".selectedActiveCategoryLinkColorBlue")[0];  
               getPosts(0, allPostSelectedLinkBlueColorRef);//call getPost(); and pass '0' zero value by default and 
               //also pass the reference of selected active link which is -> "All Post" with blue color selected/active link .
               // pass "0"/zero means, when user login their profile they can see all post by default
               //after that if they click any category then we show them that specific category post only.
               
               
            });
        </script>
        
        <!--end of load all post-->



    </body>
</html>
