package com.tech.diary.utility.helper;

import java.sql.*;

/**
 *
 * @author Md. Talal Wasim
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {

            if (con == null) {

                //load driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                //create a connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techdiary", "root", "wasim");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
