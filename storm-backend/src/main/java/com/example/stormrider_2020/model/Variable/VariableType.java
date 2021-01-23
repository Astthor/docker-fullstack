package com.example.stormrider_2020.model.Variable;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "variable_type", schema = "stormrider", catalog = "")
public class VariableType {

    private int variableTypeId;
    private Set<VariableTypeLanguage> variableTypeLanguages;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "variable_type_id", nullable = false)
    public int getVariableTypeId() {
        return variableTypeId;
    }
    public void setVariableTypeId(int variableTypeId) {
        this.variableTypeId = variableTypeId;
    }

    @OneToMany(mappedBy="variableTypeId")
    public Set<VariableTypeLanguage> getVariableTypeLanguages() {
        return variableTypeLanguages;
    }
    public void setVariableTypeLanguages(Set<VariableTypeLanguage> variableTypeLanguages) {
        this.variableTypeLanguages = variableTypeLanguages;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
