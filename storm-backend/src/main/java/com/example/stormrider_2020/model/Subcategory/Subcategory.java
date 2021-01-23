package com.example.stormrider_2020.model.Subcategory;

import com.example.stormrider_2020.model.Category.Category;
import com.example.stormrider_2020.model.ProductGroup.ProductGroup;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "subcategory", schema = "stormrider", catalog = "")
public class Subcategory {

    private int subcategoryId;
    private Set<SubcategoryLanguage> subcategoryLanguages;
    private Set<ProductGroup> productGroups;

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

    @OneToMany(mappedBy="subcategoryId")
    public Set<SubcategoryLanguage> getSubcategoryLanguages() {
        return subcategoryLanguages;
    }
    public void setSubcategoryLanguages(Set<SubcategoryLanguage> subcategoryLanguages) {
        this.subcategoryLanguages = subcategoryLanguages;
    }

    @ManyToMany
    @JoinTable(
            name = "product_group_has_subcategory",
            joinColumns = @JoinColumn(name = "subcategory_id"),
            inverseJoinColumns = @JoinColumn(name = "product_group_id"))
    public Set<ProductGroup> getProductGroups() {
        return productGroups;
    }
    public void setProductGroups(Set<ProductGroup> productGroups) {
        this.productGroups = productGroups;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
