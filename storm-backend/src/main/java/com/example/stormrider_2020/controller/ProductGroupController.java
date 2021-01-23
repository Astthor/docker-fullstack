package com.example.stormrider_2020.controller;

import com.example.stormrider_2020.model.ProductGroup.ProductGroup;
import com.example.stormrider_2020.service.ProductGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/product-group")
@CrossOrigin(origins = "http://localhost:3000")
public class ProductGroupController {

    @Autowired
    ProductGroupService productGroupService;


//======================================================================================================================
//  GET METHODS
//======================================================================================================================


//  Will return a list of all Product Groups
//  --------------------------------------------------------------------------------------------------------------------
    @GetMapping("/all")
    public ResponseEntity<List<ProductGroup>> getAllProductGroup() {
        return productGroupService.getAll();
    }


//  Will return a Product Group by its ID
//  --------------------------------------------------------------------------------------------------------------------
    @GetMapping("/{id}")
    public ResponseEntity<ProductGroup> getProductGroupById (@PathVariable("id") int id) {
        return productGroupService.getById(id);
    }


//======================================================================================================================
//  POST METHODS
//======================================================================================================================


}
