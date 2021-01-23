package com.example.stormrider_2020.model.Category;

import com.example.stormrider_2020.model.Subcategory.Subcategory;
import com.example.stormrider_2020.model.Subcategory.SubcategoryHasCategory;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "category", schema = "stormrider", catalog = "")
public class Category {

    private int categoryId;
    private Set<CategoryLanguage> categoryLanguages;
    private Set<Subcategory> subcategories;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "category_id", nullable = false)
    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @OneToMany(mappedBy="categoryId")
    public Set<CategoryLanguage> getCategoryLanguages() {
        return categoryLanguages;
    }
    public void setCategoryLanguages(Set<CategoryLanguage> categoryLanguages) {
        this.categoryLanguages = categoryLanguages;
    }


    @ManyToMany
    @JoinTable(
            name = "subcategory_has_category",
            joinColumns = @JoinColumn(name = "category_id"),
            inverseJoinColumns = @JoinColumn(name = "subcategory_id"))
    public Set<Subcategory> getSubcategories() {
        return subcategories;
    }
    public void setSubcategories(Set<Subcategory> subcategories) {
        this.subcategories = subcategories;
    }


//==============================================================================================
//  METHODS
//==============================================================================================

}
