package com.example.stormrider_2020.repository;

import com.example.stormrider_2020.model.ProductGroup.ProductGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductGroupRepository extends JpaRepository<ProductGroup, Long> {

    ProductGroup findByProductGroupId(int productGroupId);

}
