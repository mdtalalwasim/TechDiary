
package com.tech.diary.data.model;

/**
 *
 * @author Md. Talal Wasim
 */
public class Category {
    
    private int categoriesId;   
    private String categoriesName;   
    private String categoriesDesc;

    public Category(int categoriesId, String categoriesName, String categoriesDesc) {
        this.categoriesId = categoriesId;
        this.categoriesName = categoriesName;
        this.categoriesDesc = categoriesDesc;
    }

    public Category() {
    }

    public Category(String categoriesName, String categoriesDesc) {
        this.categoriesName = categoriesName;
        this.categoriesDesc = categoriesDesc;
    }
    
    //Setter and Getter...

    public int getCategoriesId() {
        return categoriesId;
    }

    public void setCategoriesId(int categoriesId) {
        this.categoriesId = categoriesId;
    }

    public String getCategoriesName() {
        return categoriesName;
    }

    public void setCategoriesName(String categoriesName) {
        this.categoriesName = categoriesName;
    }

    public String getCategoriesDesc() {
        return categoriesDesc;
    }

    public void setCategoriesDesc(String categoriesDesc) {
        this.categoriesDesc = categoriesDesc;
    }
    
    
    
    
}
