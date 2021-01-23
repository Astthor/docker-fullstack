package com.example.stormrider_2020.model.Variable;

import javax.persistence.*;

@Entity
@Table(name = "variable_language", schema = "stormrider", catalog = "")
public class VariableLanguage {

    private int variableLanguageId;
    private String appLanguageCode;
    private String variableName;
    private String variableComment;
    private int variableId;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "variable_language_id", nullable = false)
    public int getVariableLanguageId() {
        return variableLanguageId;
    }
    public void setVariableLanguageId(int variableLanguageId) {
        this.variableLanguageId = variableLanguageId;
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
    @Column(name = "variable_name", nullable = false, precision = 0)
    public String getVariableName() {
        return variableName;
    }
    public void setVariableName(String variableName) {
        this.variableName = variableName;
    }

    @Basic
    @Column(name = "variable_comment", nullable = true, precision = 0)
    public String getVariableComment() {
        return variableComment;
    }
    public void setVariableComment(String variableComment) {
        this.variableComment = variableComment;
    }

    @Basic
    @Column(name = "variable_id", nullable = false, precision = 0)
    public int getVariableId() {
        return variableId;
    }
    public void setVariableId(int variableId) {
        this.variableId = variableId;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
