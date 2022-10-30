
package com.tech.diary.data.model;

import java.sql.Timestamp;

/**
 *
 * @author Md. Talal Wasim
 */
public class Post {
    
    private int postId;
    private String postTitle;
    private String postContent;
    private String postCode;
    private String postPic;
    private Timestamp postDate;
    private int catId;

    public Post() {
    }

    public Post(int postId, String postTitle, String postContent, String postCode, String postPic, Timestamp postDate, int catId) {
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postCode = postCode;
        this.postPic = postPic;
        this.postDate = postDate;
        this.catId = catId;
    }

    public Post(String postTitle, String postContent, String postCode, String postPic, Timestamp postDate, int catId) {
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postCode = postCode;
        this.postPic = postPic;
        this.postDate = postDate;
        this.catId = catId;
    }
    
    
    //setter and getter

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getPostPic() {
        return postPic;
    }

    public void setPostPic(String postPic) {
        this.postPic = postPic;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    
    
    
    
    
}
