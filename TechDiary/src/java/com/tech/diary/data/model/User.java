
package com.tech.diary.data.model;

import java.sql.Timestamp;

/**
 *
 * @author Md. Talal Wasim
 */
public class User {

    
    private int userId;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String userGender;
    private String userAbout;
    private Timestamp dateTime;
    private String userProfile;

//    public User(int userId, String userName, String userEmail, String userPassword, String userGender, String userAbout, Timestamp dateTime) {
    public User(int userId, String userName, String userEmail, String userPassword, String userGender, String userAbout) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userGender = userGender;
        this.userAbout = userAbout;
        //this.dateTime = dateTime;
    }

    public User() {

    }

    //public User(String userName, String userEmail, String userPassword, String userGender, String userAbout, Timestamp dateTime) {
    public User(String userName, String userEmail, String userPassword, String userGender, String userAbout) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userGender = userGender;
        this.userAbout = userAbout;
        //this.dateTime = dateTime;//no need to initialize this... it will take by default(see db table column)
    }

    //End - Constructor
//    getter and setter for set and get the vallue
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserAbout() {
        return userAbout;
    }

    public void setUserAbout(String userAbout) {
        this.userAbout = userAbout;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getUserProfile() {
        return userProfile;
    }

    public void setUserProfile(String userProfile) {
        this.userProfile = userProfile;
    }
    
    
}
