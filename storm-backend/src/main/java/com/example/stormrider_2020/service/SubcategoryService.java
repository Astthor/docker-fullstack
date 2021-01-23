package com.example.stormrider_2020.service;

import com.example.stormrider_2020.model.Subcategory.Subcategory;
import com.example.stormrider_2020.repository.SubcategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubcategoryService {

    @Autowired
    SubcategoryRepository subcategoryRepository;


    public ResponseEntity<List<Subcategory>> getAll() {
        try {
            List<Subcategory> subcategories = subcategoryRepository.findAll();

            if (subcategories.isEmpty())
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            else
                return new ResponseEntity<>(subcategories, HttpStatus.OK);

        } catch(Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    public ResponseEntity<Subcategory> getById (int id) {
        try {
            Subcategory subcategory = subcategoryRepository.findBySubcategoryId(id);
            return new ResponseEntity<>(subcategory, HttpStatus.OK);

        } catch(Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
