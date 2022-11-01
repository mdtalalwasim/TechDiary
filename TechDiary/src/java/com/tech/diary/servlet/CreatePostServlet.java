package com.tech.diary.servlet;

import com.tech.diary.dao.PostDAO;
import com.tech.diary.data.model.Post;
import com.tech.diary.data.model.User;
import com.tech.diary.utility.helper.ConnectionProvider;
import com.tech.diary.utility.helper.ProfilePicUploadHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Md. Talal Wasim
 */
@MultipartConfig
public class CreatePostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CreatePostServlet</title>");
//            out.println("</head>");
//            out.println("<body>");

            //fetch data which is come form "Create Post Modal" which id="add-post-model" of "user_profile.jsp" page
            //fetch data from -> "Create Post Modal" form data of form id="create-post-form-id" 
            int catId = Integer.parseInt(request.getParameter("catId"));
            String postTitle = request.getParameter("post_title");
            String postContent = request.getParameter("post_content");
            String postCode = request.getParameter("post_code");
            //for getting pic name...
            Part part = request.getPart("post_pic");
            String postPic = part.getSubmittedFileName();

            //getting current user id who is actually log in right now.
            //(we need to know which user actually creating this post)
            //for current session
            HttpSession session = request.getSession();

            //get current user from session
            User user = (User) session.getAttribute("currentUser");
            int userId = user.getUserId();

//            out.println("Cat ID is " + catId);
//            out.println("Title is " + postTitle);
//            out.println("Content is " + postContent);
//            out.println("Code is " + postCode);
//            out.println("Pic is " + postPic);
//            out.println("Current User ID is " + userId);
//            out.println("Current User Name is " + user.getUserName());

            //postDate set to null. no need to input date... it will take automaticall by now() in default
            Post objPost = new Post(postTitle, postContent, postCode, postPic, null, catId, userId);

            PostDAO objPostDao = new PostDAO(ConnectionProvider.getConnection());

            if (objPostDao.saveCreatePost(objPost) == true) {

                //save post pic in "blog_pics" folder.
                String blogPicsPath = request.getRealPath("/") + "blog_pics" + File.separator + postPic;
                ProfilePicUploadHelper.saveFile(part.getInputStream(), blogPicsPath);

                out.println("done");

            } else {
                out.println("error");

            }
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
