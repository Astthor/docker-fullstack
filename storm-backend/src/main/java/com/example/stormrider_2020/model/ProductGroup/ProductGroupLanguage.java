package com.example.stormrider_2020.model.ProductGroup;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "product_group_language", schema = "stormrider", catalog = "")
public class ProductGroupLanguage {

    private int productGroupLanguageId;
    private String appLanguageCode;
    private int productGroupId;
    private String productGroupName;
    private String productGroupDescription;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "product_group_language_id", nullable = false)
    public int getProductGroupLanguageId() {
        return productGroupLanguageId;
    }
    public void setProductGroupLanguageId(int productGroupLanguageId) {
        this.productGroupLanguageId = productGroupLanguageId;
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
    @Column(name = "product_group_id", nullable = false)
    public int getProductGroupId() {
        return productGroupId;
    }
    public void setProductGroupId(int productGroupId) {
        this.productGroupId = productGroupId;
    }

    @Basic
    @Column(name = "product_group_name", nullable = false, length = 100)
    public String getProductGroupName() {
        return productGroupName;
    }
    public void setProductGroupName(String productGroupName) {
        this.productGroupName = productGroupName;
    }

    @Basic
    @Column(name = "product_group_description", nullable = true, length = 500)
    public String getProductGroupDescription() {
        return productGroupDescription;
    }
    public void setProductGroupDescription(String productGroupDescription) {
        this.productGroupDescription = productGroupDescription;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
