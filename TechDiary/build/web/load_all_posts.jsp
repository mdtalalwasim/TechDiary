<%@page import="java.util.List"%>
<%@page import="com.tech.diary.data.model.Post"%>
<%@page import="com.tech.diary.utility.helper.ConnectionProvider"%>
<%@page import="com.tech.diary.dao.PostDAO"%>

<div class="row">

    <%
        Thread.sleep(500); //sleep for half second to visible loader smoothly.
        PostDAO objPostDAO = new PostDAO(ConnectionProvider.getConnection());

        //here, first -> fetch the "key" value -> "catId" value which is coming from "user_profile.jsp" -> 'load all post' javaScript section
        //
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
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getPostPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getPostTitle()%></b>
                <p><%= p.getPostContent()%></p>
                <pre><code><%= p.getPostCode()%></code></pre>

            </div>


        </div>

    </div>

    <%
        }


    %>







</div>