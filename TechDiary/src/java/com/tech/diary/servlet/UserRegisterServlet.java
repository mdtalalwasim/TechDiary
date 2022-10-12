package com.tech.diary.servlet;

import com.tech.diary.dao.UserDAO;
import com.tech.diary.data.model.User;
import com.tech.diary.utility.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
//import java.tech.diary.utility.helper.ConnctionProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wasim Ahmed
 */
@MultipartConfig // this annotation is for informing to the 'servelt' that be ready to receive complex data which is coming throug our submitted form.
//inform to servlet -> this form has complex or all types of data like image, long data, file, text, and etc... so get ready to receive
public class UserRegisterServlet extends HttpServlet {

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
//            out.println("<title>Servlet UserRegisterServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");

            //fetch all data from the UserRegister Form which is in registration_page.
            String check = request.getParameter("user_check");

            if (check == null) {

                out.println("Please agree terms and condition.");

            } else {

                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("user_gender");
                String about = request.getParameter("user_about");
//                out.println(name);
//                out.println(email); //just print the value for checking...

                //create User object:and set all the data to that object
                //means all data of user bind into one Object. 
                //ie. User object or object of user.
                User user = new User(name, email, password, gender, about);

                //now time to insert all data into DataBase;
                //use UserDAO class...for inserting abvobe data into database 
                //by creating UserDAO calss object... 
                UserDAO dao = new UserDAO(ConnectionProvider.getConnection());
                //saveUser takes User object.

                if (dao.saveUser(user)) {
                    //saveUser return 'true'     
                    out.println("done");
                } else {
                    out.println("error");
                }

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
