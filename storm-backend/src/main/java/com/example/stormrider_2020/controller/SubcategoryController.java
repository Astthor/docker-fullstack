package com.example.stormrider_2020.controller;

import com.example.stormrider_2020.model.Subcategory.Subcategory;
import com.example.stormrider_2020.service.SubcategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/subcategory")
@CrossOrigin(origins = "http://localhost:3000")
public class SubcategoryController {

    @Autowired
    SubcategoryService subcategoryService;


//======================================================================================================================
//  GET METHODS
//======================================================================================================================


//  Will return a list of all Subcategories
//  --------------------------------------------------------------------------------------------------------------------
    @GetMapping("/all")
    public ResponseEntity<List<Subcategory>> getAllSubcategory() {
        return subcategoryService.getAll();
    }


//  Will return a Subcategory by its ID
//  --------------------------------------------------------------------------------------------------------------------
    @GetMapping("/{id}")
    public ResponseEntity<Subcategory> getSubcategoryById (@PathVariable("id") int id) {
        return subcategoryService.getById(id);
    }


//======================================================================================================================
//  POST METHODS
//======================================================================================================================



}
