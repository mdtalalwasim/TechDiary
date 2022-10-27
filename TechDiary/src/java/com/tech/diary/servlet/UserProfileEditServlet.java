package com.tech.diary.servlet;

import com.tech.diary.dao.UserDAO;
import com.tech.diary.data.model.Message;
import com.tech.diary.data.model.User;
import com.tech.diary.utility.helper.ConnectionProvider;
import com.tech.diary.utility.helper.ProfilePicUploadHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@MultipartConfig //to notify servlet carry multipartconfig file like image,file,and etc
public class UserProfileEditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserProfileEditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch all data which is comes from "user_profile.jsp" page =>from User Profile Edit section
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("user_profileImage");//for file upload-> means profile image
            String userProfileImageName = part.getSubmittedFileName(); // to get uploaded profile image name.

            // get the old user from session
            //in servlet we need to get session explicitely, to do so:
            HttpSession session = request.getSession();
            //to get logged in User / Current login user: 
            // session.getAttribute("currentUser"); ->return "User" type object and store in "user"
            // this "user" obj has old details of Current logged in user.
            //look, we need to replace 'old/current user data' with above given updated data  => for Editing the user data.
            User user = (User) session.getAttribute("currentUser"); // get current user who is log in
            //replace old data with new given updated data
            user.setUserEmail(userEmail);
            user.setUserName(userName);
            user.setUserPassword(userPassword);
            user.setUserAbout(userAbout);
            //oldProfilePic is store the old profile pic
            String oldProfilePic = user.getUserProfile();//this will help to delete old profile pic after updating new profile pic
            user.setUserProfile(userProfileImageName);//new profile pic updated 

            //create obj for UserDAO to use/call non static "updateUser()" methods from UserDAO class
            //and create or pass the database connection...
            UserDAO userDaoObj = new UserDAO(ConnectionProvider.getConnection());
            boolean returnValue = userDaoObj.updateUser(user);//pass the user obj..."updateUser()" return boolean value and hold it in variable;
            if (returnValue == true) {

                //profile pic updated code...
                //get path of Profile pic
                //request.getRealPath("/") will take us to "Web Pages" Folder of this projec
                //the below -> path will be like this: Web Pages/pics/ 
                //[note:we use "File.separator" for forword slash i.e "/"] 
                //user.getUserProfile() this means name of old profile pic
                //new profile pic path
                String path = request.getRealPath("/") + "pics" + File.separator + user.getUserProfile();
                //old Profile pic path
                String oldProfilePicPath = request.getRealPath("/") + "pics" + File.separator + oldProfilePic;

                //delet old file / profile pic
                if (!oldProfilePic.equals("default.png") == true) {//if pic is not "default.png" then delete.
                    ProfilePicUploadHelper.deleteFile(oldProfilePicPath);

                }

                //new data means new profile pic is in ->InputStream 
                //so we need to get this through "part"-> part.getInputStream()
                //we get new profile pic and save it through saveFile() method
                if (ProfilePicUploadHelper.saveFile(part.getInputStream(), path)) {

                    out.println("successfully updated!");

                    //create Message Class object
                    Message msgObj = new Message("Profile successfully updated!", "success", "alert-success");

                    //set msgObj or message into session.
                    session.setAttribute("msg", msgObj); //key, value pair...

                } else {
                    out.println("something Error! for profile pic...");
                    //create Message Class object
                    Message msgObj = new Message("something went wrong!", "error", "alert-danger");
                    //set msgObj or message into session.
                    session.setAttribute("msg", msgObj);
                }

            } else {
                out.println("something went wrong!");
                //create Message Class object
                Message msgObj = new Message("something went wrong!", "error", "alert-danger");
                //set msgObj or message into session.
                session.setAttribute("msg", msgObj);
            }
            
            //if all ok
            response.sendRedirect("user_profile.jsp");
            
            out.println("</body>");
            out.println("</html>");
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
