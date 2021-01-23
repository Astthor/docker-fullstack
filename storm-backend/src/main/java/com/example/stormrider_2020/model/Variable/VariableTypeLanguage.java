package com.example.stormrider_2020.model.Variable;

import javax.persistence.*;

@Entity
@Table(name = "variable_type_language", schema = "stormrider", catalog = "")
public class VariableTypeLanguage {

    private int variableTypeLanguageId;
    private String appLanguageCode;
    private String variableTypeName;
    private String variableTypeComment;
    private int variableTypeId;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "variable_type_language_id", nullable = false)
    public int getVariableTypeLanguageId() {
        return variableTypeLanguageId;
    }
    public void setVariableTypeLanguageId(int variableTypeLanguageId) {
        this.variableTypeLanguageId = variableTypeLanguageId;
    }

    @Basic
    @Column(name = "app_language_code", nullable = false, precision = 0)
    public String getAppLanguageCode() {
        return appLanguageCode;
    }
    public void setAppLanguageCode(String appLanguageCode) {
        this.appLanguageCode = appLanguageCode;
    }

    @Basic
    @Column(name = "variable_type_name", nullable = false, precision = 0)
    public String getVariableTypeName() {
        return variableTypeName;
    }
    public void setVariableTypeName(String variableTypeName) {
        this.variableTypeName = variableTypeName;
    }

    @Basic
    @Column(name = "variable_type_comment", nullable = true, precision = 0)
    public String getVariableTypeComment() {
        return variableTypeComment;
    }
    public void setVariableTypeComment(String variableTypeComment) {
        this.variableTypeComment = variableTypeComment;
    }

    @Basic
    @Column(name = "variable_type_id", nullable = false, precision = 0)
    public int getVariableTypeId() {
        return variableTypeId;
    }
    public void setVariableTypeId(int variableTypeId) {
        this.variableTypeId = variableTypeId;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
