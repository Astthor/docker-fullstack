package com.example.stormrider_2020.model.Subcategory;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "subcategory_has_category", schema = "stormrider", catalog = "")
public class SubcategoryHasCategory {

    private int subcategoryId;
    private int categoryId;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "subcategory_id", nullable = false)
    public int getSubcategoryId() {
        return subcategoryId;
    }
    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    @Column(name = "category_id", nullable = false)
    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
