package com.example.stormrider_2020.model.Variable;

import javax.persistence.*;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "variable", schema = "stormrider", catalog = "")
public class Variable {

    private int variableId;
    private VariableType variableType;
    private Set<VariableLanguage> variableLanguages;

//==============================================================================================
//  GETTERS & SETTERS
//==============================================================================================

    @Id
    @Column(name = "variable_id", nullable = false)
    public int getVariableId() {
        return variableId;
    }
    public void setVariableId(int variableId) {
        this.variableId = variableId;
    }

    @ManyToOne
    @JoinColumn(name="variable_type_id", nullable=false)
    public VariableType getVariableType() {
        return variableType;
    }
    public void setVariableType(VariableType variableType) {
        this.variableType = variableType;
    }

    @OneToMany(mappedBy="variableId")
    public Set<VariableLanguage> getVariableLanguages() {
        return variableLanguages;
    }
    public void setVariableLanguages(Set<VariableLanguage> variableLanguages) {
        this.variableLanguages = variableLanguages;
    }

//==============================================================================================
//  METHODS
//==============================================================================================

}
