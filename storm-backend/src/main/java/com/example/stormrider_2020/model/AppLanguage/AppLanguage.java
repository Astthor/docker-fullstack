package com.example.stormrider_2020.model.AppLanguage;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "app_language", schema = "stormrider", catalog = "")
public class AppLanguage {

    private String code;
    private String language;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "code", nullable = false, length = 2)
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "language", nullable = true, length = 20)
    public String getLanguage() {
        return language;
    }
    public void setLanguage(String language) {
        this.language = language;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
