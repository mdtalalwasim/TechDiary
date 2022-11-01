
package com.tech.diary.dao;

import com.tech.diary.data.model.Category;
import com.tech.diary.data.model.Post;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Md. Talal Wasim
 */
public class PostDAO {
    
    Connection con;

    public PostDAO(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
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
    
    public boolean saveCreatePost(Post postObj){
        
        boolean f=false;
        
        try {
            
            String query = "insert into post_tbl(postTitle, postContent, postCode, postPic, catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,postObj.getPostTitle());
            pstmt.setString(2,postObj.getPostContent());
            pstmt.setString(3,postObj.getPostCode());
            pstmt.setString(4,postObj.getPostPic());
            pstmt.setInt(5,postObj.getCatId());
            pstmt.setInt(6,postObj.getUserId());
            pstmt.executeUpdate();
            
            //now if all okay then set the f value to "true"
            f =true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
}
