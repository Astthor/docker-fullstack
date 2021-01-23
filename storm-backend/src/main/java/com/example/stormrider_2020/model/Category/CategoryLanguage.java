package com.example.stormrider_2020.model.Category;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "category_language", schema = "stormrider", catalog = "")
public class CategoryLanguage {

    private int categoryLanguageId;
    private String appLanguageCode;
    private int categoryId;
    private String name;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "category_language_id", nullable = false)
    public int getCategoryLanguageId() {
        return categoryLanguageId;
    }
    public void setCategoryLanguageId(int categoryLanguageId) {
        this.categoryLanguageId = categoryLanguageId;
    }

    @Basic
    @Column(name = "app_language_code", nullable = false, length = 2)
    public String getAppLanguageCode() {
        return appLanguageCode;
    }
    public void setAppLanguageCode(String appLanguageCode) {
        this.appLanguageCode = appLanguageCode;
    }

    @Basic
    @Column(name = "category_id", nullable = false)
    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 100)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
