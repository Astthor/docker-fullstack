package com.example.stormrider_2020.repository;

import com.example.stormrider_2020.model.Subcategory.Subcategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubcategoryRepository extends JpaRepository<Subcategory, Long> {

    Subcategory findBySubcategoryId(int subcategoryId);

}
