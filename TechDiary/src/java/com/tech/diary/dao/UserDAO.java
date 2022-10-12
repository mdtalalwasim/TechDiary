package com.tech.diary.dao;

import com.tech.diary.data.model.User;
import java.sql.*;

/**
 *
 * @author Wasim Ahmed
 */
public class UserDAO {

    // because this class needs Database Conneciton so we declare Connection variable : con
    private Connection con;

    //initilizing con using constructor
    public UserDAO(Connection con) {
        this.con = con;
    }

    // insert User into database
    public boolean saveUser(User user) {

        boolean f = false;

        try {

            //user ---> is going to inserted user_registration_tbl into database
            String query = "insert into user_registration_tbl(userName, userEmail, userPassword, userGender, userAbout) values(?,?,?,?,?)";
            //String query = "insert into user_registration_tbl(userName, userEmail, userPassword, userGender, userAbout) values(?,?,?,?,?);";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getUserEmail());
            pstmt.setString(3, user.getUserPassword());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserAbout());

            pstmt.executeUpdate();

            f = true; //if query execute successfully...

        } catch (Exception e) {

            e.printStackTrace();
        }
        return f;

    }

}
