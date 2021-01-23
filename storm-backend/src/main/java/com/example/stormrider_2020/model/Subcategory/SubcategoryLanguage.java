package com.example.stormrider_2020.model.Subcategory;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "subcategory_language", schema = "stormrider", catalog = "")
public class SubcategoryLanguage {

    private int subcategoryLanguageId;
    private String appLanguageCode;
    private int subcategoryId;
    private String name;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "subcategory_language_id", nullable = false)
    public int getSubcategoryLanguageId() {
        return subcategoryLanguageId;
    }
    public void setSubcategoryLanguageId(int subcategoryLanguageId) {
        this.subcategoryLanguageId = subcategoryLanguageId;
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
    @Column(name = "subcategory_id", nullable = false)
    public int getSubcategoryId() {
        return subcategoryId;
    }
    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
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
