package com.tech.diary.dao;

import com.tech.diary.data.model.Category;
import com.tech.diary.data.model.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Md. Talal Wasim
 */
public class PostDAO {

    Connection con;

    public PostDAO(Connection con) {
        this.con = con;
    }

    //get all Categories
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> listOfCategory = new ArrayList<>();

        try {

            String query = "select * from categories_tbl";

            Statement stmt = this.con.createStatement();
            ResultSet resultSet = stmt.executeQuery(query);

            while (resultSet.next()) {
                int cId = resultSet.getInt("categoriesId");
                String cName = resultSet.getString("categoriesName");
                String cDescription = resultSet.getString("categoriesDesc");

                Category cat = new Category(cId, cName, cDescription);
                listOfCategory.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listOfCategory; //return ArrayList 
    }

    //save create post in db
    public boolean saveCreatePost(Post postObj) {

        boolean f = false;

        try {

            String query = "insert into post_tbl(postTitle, postContent, postCode, postPic, catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, postObj.getPostTitle());
            pstmt.setString(2, postObj.getPostContent());
            pstmt.setString(3, postObj.getPostCode());
            pstmt.setString(4, postObj.getPostPic());
            pstmt.setInt(5, postObj.getCatId());
            pstmt.setInt(6, postObj.getUserId());
            pstmt.executeUpdate();

            //now if all okay then set the f value to "true"
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //get all post
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();

        //fetch all post
        try {
            String q = "select * from post_tbl order by postId desc";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {

                int pId = resultSet.getInt("postId");
                String pTitle = resultSet.getString("postTitle");
                String pContent = resultSet.getString("postContent");
                String pCode = resultSet.getString("postCode");
                String pPic = resultSet.getString("postPic");
                Timestamp pDate = resultSet.getTimestamp("postDate");
                int categoryId = resultSet.getInt("catId");
                int userId = resultSet.getInt("userId");

                Post objPost = new Post(pId, pTitle, pContent, pCode, pPic, pDate, categoryId, userId);
                list.add(objPost); // add all post obj into list obj.

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCategoryId(int catId) {
        List<Post> list = new ArrayList<>();

        //get all post by categories id
        //fetch all post
        try {
            String q = "select * from post_tbl where catId=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, catId);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {

                int pId = resultSet.getInt("postId");
                String pTitle = resultSet.getString("postTitle");
                String pContent = resultSet.getString("postContent");
                String pCode = resultSet.getString("postCode");
                String pPic = resultSet.getString("postPic");
                Timestamp pDate = resultSet.getTimestamp("postDate");
                //int categoryId = resultSet.getInt("catId");
                int userId = resultSet.getInt("userId");

                Post objPost = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(objPost); // add all post obj into list obj.

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostID(int postId) {

        
        Post post=null;
        try {

            String query = "select * from post_tbl where postId=?";

            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, postId);
            
            ResultSet resultSet = pstmt.executeQuery();
            
            if (resultSet.next()) {
                //if any row get...then fetch all post data...
                
                int pId = resultSet.getInt("postId");
                String pTitle = resultSet.getString("postTitle");
                String pContent = resultSet.getString("postContent");
                String pCode = resultSet.getString("postCode");
                String pPic = resultSet.getString("postPic");
                Timestamp pDate = resultSet.getTimestamp("postDate");
                int categoryId = resultSet.getInt("catId");
                int userId = resultSet.getInt("userId");

                post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, categoryId, userId);
                
                
            }

        } catch (Exception e) { 
            e.printStackTrace();
        }

        return post;
    }
}
