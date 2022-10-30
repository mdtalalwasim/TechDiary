
package com.tech.diary.dao;

import com.tech.diary.data.model.Category;
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
}
