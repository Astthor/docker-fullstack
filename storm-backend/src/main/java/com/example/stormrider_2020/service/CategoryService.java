package com.example.stormrider_2020.service;

import com.example.stormrider_2020.model.Category.Category;
import com.example.stormrider_2020.model.Category.CategoryLanguage;
import com.example.stormrider_2020.model.Subcategory.Subcategory;
import com.example.stormrider_2020.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Set;

@Service
public class CategoryService {

    @Autowired
    CategoryRepository categoryRepository;


    public ResponseEntity<List<Category>> getAll() {
        try {
                List<Category> categories = categoryRepository.findAll();
                if (categories.isEmpty())
                    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
                else
                    return new ResponseEntity<>(categories, HttpStatus.OK);

        } catch(Exception e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    public ResponseEntity<Category> getById (int id) {
        try {
            Category category = categoryRepository.findByCategoryId(id);
            return new ResponseEntity<>(category, HttpStatus.OK);

        } catch(Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}
