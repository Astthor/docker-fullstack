package com.example.stormrider_2020.model.ProductGroup;

import com.example.stormrider_2020.model.Product.Product;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "product_group", schema = "stormrider", catalog = "")
public class ProductGroup {

    private int productGroupId;
    private double basePrice;
    private double vat;
    private ProductGroupImage productGroupImage;
    private Set<ProductGroupLanguage> productGroupLanguages;
    private Set<Product> products;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "product_group_id", nullable = false)
    public int getProductGroupId() {
        return productGroupId;
    }
    public void setProductGroupId(int productGroupId) {
        this.productGroupId = productGroupId;
    }

    @Basic
    @Column(name = "base_price", nullable = false, precision = 0)
    public double getBasePrice() {
        return basePrice;
    }
    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    @Basic
    @Column(name = "vat", nullable = false, precision = 0)
    public double getVat() {
        return vat;
    }
    public void setVat(double vat) {
        this.vat = vat;
    }

    @OneToOne
    @JoinColumn(name="product_group_image_id", nullable=false)
    public ProductGroupImage getProductGroupImage() {
        return productGroupImage;
    }
    public void setProductGroupImage(ProductGroupImage productGroupImage) {
        this.productGroupImage = productGroupImage;
    }

    @OneToMany(mappedBy="productGroupId")
    public Set<ProductGroupLanguage> getProductGroupLanguages() {
        return productGroupLanguages;
    }
    public void setProductGroupLanguages(Set<ProductGroupLanguage> productGroupLanguages) {
        this.productGroupLanguages = productGroupLanguages;
    }

    @OneToMany(mappedBy="productGroupId")
    public Set<Product> getProducts() {
        return products;
    }
    public void setProducts(Set<Product> products) {
        this.products = products;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
