package com.example.stormrider_2020.service;


import com.example.stormrider_2020.model.ProductGroup.ProductGroup;
import com.example.stormrider_2020.repository.ProductGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductGroupService {

    @Autowired
    ProductGroupRepository productGroupRepository;

    public ResponseEntity<List<ProductGroup>> getAll() {
        try {
            List<ProductGroup> productGroups = productGroupRepository.findAll();

            if (productGroups.isEmpty())
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            else
                return new ResponseEntity<>(productGroups, HttpStatus.OK);

        } catch(Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    public ResponseEntity<ProductGroup> getById (int id) {
        try {
            ProductGroup productGroup = productGroupRepository.findByProductGroupId(id);
            return new ResponseEntity<>(productGroup, HttpStatus.OK);

        } catch(Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
