package com.tech.diary.dao;

import com.tech.diary.data.model.User;
import java.sql.*;

/**
 *
 * @author Md. Talal Wasim
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

    //get user information -> email and password :
    //method return type User.
    public User getUserEmailPassword(String email, String password) {

        User user = null;

        try {

            String query = "select * from user_registration_tbl where userEmail=? and userPassword=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet resultSet = pstmt.executeQuery();//executeQuery return resultSet...[return result(some data) of a user]

            if (resultSet.next()) {
                //if any row available, then fetch the data of that row...

                //create new user object
                user = new User();

                //fetch value one by one from database...
                //1st fetch name from db table...
                String name = resultSet.getString("userName"); //userName is the name of colum in db.
                //set the name into user object.
                user.setUserName(name);

                //another way -> fetch data in a Single Line...
                //or in one line we can write it as below...
                //user.setUserName(resultSet.getString("userName"));
                user.setUserId(resultSet.getInt("userId")); //"userId", "userEmail"...db cols...
                user.setUserEmail(resultSet.getString("userEmail"));
                user.setUserPassword(resultSet.getString("userPassword"));
                user.setUserGender(resultSet.getString("userGender"));
                user.setUserAbout(resultSet.getString("userAbout"));
                user.setDateTime(resultSet.getTimestamp("registrationDate"));
                user.setUserProfile(resultSet.getString("userProfile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user; //return that specific user's object
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user_registration_tbl set userName=?, userEmail=?, userPassword=?, userGender=?, userAbout=?, userProfile=? where userId=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getUserEmail());
            pstmt.setString(3, user.getUserPassword());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserAbout());
            pstmt.setString(6, user.getUserProfile());
            pstmt.setInt(7, user.getUserId());

            pstmt.executeUpdate();
            f = true;//f becomes true when query run successfully and update all data.

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by post Id.
    public User getUserByUserId(int userId) {

        User user = null;

        try {

            String q = "select * from user_registration_tbl where userId=?";

            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, userId);
            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {

                //if any row available, then fetch the data of that row...
                //create new user object
                user = new User();

                //fetch value one by one from database...
                //1st fetch name from db table...
                String name = resultSet.getString("userName"); //userName is the name of colum in db.
                //set the name into user object.
                user.setUserName(name);
                //another way -> fetch data in a Single Line...
                //or in one line we can write it as below...
                //user.setUserName(resultSet.getString("userName"));
                user.setUserId(resultSet.getInt("userId")); //"userId", "userEmail"...db cols...
                user.setUserEmail(resultSet.getString("userEmail"));
                user.setUserPassword(resultSet.getString("userPassword"));
                user.setUserGender(resultSet.getString("userGender"));
                user.setUserAbout(resultSet.getString("userAbout"));
                user.setDateTime(resultSet.getTimestamp("registrationDate"));
                user.setUserProfile(resultSet.getString("userProfile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
