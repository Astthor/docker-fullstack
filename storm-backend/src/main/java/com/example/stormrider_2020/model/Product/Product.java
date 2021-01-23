package com.example.stormrider_2020.model.Product;

import com.example.stormrider_2020.model.Variable.Variable;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "product", schema = "stormrider", catalog = "")
public class Product {

    private int productId;
    private short inventory;
    private int productGroupId;
    private Date lastUpdated;
    private Set<Variable> variables;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "product_id", nullable = false)
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "inventory", nullable = false)
    public short getInventory() {
        return inventory;
    }
    public void setInventory(short inventory) {
        this.inventory = inventory;
    }

    @Basic
    @Column(name = "product_group_id", nullable = false)
    public int getProductGroupId() {
        return productGroupId;
    }
    public void setProductGroupId(int productGroupId) {
        this.productGroupId = productGroupId;
    }

    @Basic
    @Column(name = "last_updated", nullable = false)
    public Date getLastUpdated() {
        return lastUpdated;
    }
    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    @ManyToMany
    @JoinTable(
            name = "product_has_variable",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "variable_id"))
    public Set<Variable> getVariables() {
        return variables;
    }
    public void setVariables(Set<Variable> variables) {
        this.variables = variables;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
