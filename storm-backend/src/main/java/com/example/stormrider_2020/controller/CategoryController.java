package com.example.stormrider_2020.controller;

import com.example.stormrider_2020.model.Category.Category;
import com.example.stormrider_2020.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/category")
@CrossOrigin(origins = "*")
public class CategoryController {

    @Autowired
    CategoryService categoryService;


//======================================================================================================================
//  GET METHODS
//======================================================================================================================


//  Will return a list of all Categories
//  --------------------------------------------------------------------------------------------------------------------
    @GetMapping("/all")
    public ResponseEntity<List<Category>> getAllCategory() {
        return categoryService.getAll();
    }


//  Will return a Category by its ID
//  --------------------------------------------------------------------------------------------------------------------
    @GetMapping("/{id}")
    public ResponseEntity<Category> getCategoryById (@PathVariable("id") int id) {
        return categoryService.getById(id);
    }


//======================================================================================================================
//  POST METHODS
//======================================================================================================================



}
