<%@page import="java.util.List"%>
<%@page import="com.tech.diary.data.model.Post"%>
<%@page import="com.tech.diary.utility.helper.ConnectionProvider"%>
<%@page import="com.tech.diary.dao.PostDAO"%>

<!-- customs css for this page -->
        <style type="text/css">
            .my-card {
                box-shadow: 0px 0px 10px 1px maroon;
                /*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
            }
        </style>
        <!-- end of customs css for this page -->

<div class="row">

    <%
        Thread.sleep(500); //sleep for half second to visible loader smoothly.
        PostDAO objPostDAO = new PostDAO(ConnectionProvider.getConnection());

        //here, first -> fetch the "key" value -> "catId" value which is coming from "user_profile.jsp" -> 'load all post' javaScript section
        
        int categoryID = Integer.parseInt(request.getParameter("catId")); //here, "catId" is "key" which is coming user_profile.jsp page script section

        List<Post> allPosts = null; //by default set allPost to null.
        if (categoryID == 0) {
            //catId == 0 then load all post
            allPosts = objPostDAO.getAllPosts();

        } 
        
        else {
            //load not all the post but load specific catId post.
            allPosts = objPostDAO.getPostByCategoryId(categoryID);//show post by category Id.
        }
        
        if(allPosts.size()==0){ //list-> size() method
            out.println("<h3 class='display-4 text-center'>Not available any post in this Category...</h3>");
            return; //return from here
            
        }

        for (Post p : allPosts) {
    %>
    
     

 

    <div class="col-md-6 mt-3">
        <div class="card my-card">
            <img class="card-img-top" src="blog_pics/<%= p.getPostPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getPostTitle()%></b>
<!--                <p><%= p.getPostContent()%></p>-->
                

            </div>
            <div class="card-footer text-center my-primary-background">
                <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-thumbs-o-up"></i><span>10</span></a>                
                <a href="show_post_details.jsp?post_id=<%= p.getPostId() %>" class="btn btn-outline-light btn-sm" >Read More</a>                
                <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-commenting-o"></i><span>20</span></a>                

            </div>


        </div>

    </div>

    <%
        }


    %>







</div>