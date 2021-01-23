package com.example.stormrider_2020.model.ProductGroup;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "product_group_image", schema = "stormrider", catalog = "")
public class ProductGroupImage {

    private int productGroupImageId;
    private String image;
    private String name;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "product_group_image_id", nullable = false)
    public int getProductGroupImageId() {
        return productGroupImageId;
    }
    public void setProductGroupImageId(int productGroupImageId) {
        this.productGroupImageId = productGroupImageId;
    }

    @Basic
    @Column(name = "image", nullable = false, length = 256)
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 45)
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
