import React from 'react';
import {Container, Row, Col, Image, Form, Card} from "react-bootstrap";


class VariableList extends React.Component {

//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        const variableTypes = [];
        const language = this.props.language;   // Declares a language variable and assigns the value to it
                                                // passed from the App.js component as 'language'
        console.log(variableTypes);
        return (
            <Form>
                {
                    this.props.variables.map((variable) =>
                        <>
                            {
                                variableTypes.includes(variable.variableType.variableTypeId) ?
                                    null
                                    :
                                    variableTypes.push(variable.variableType.variableTypeId)
                                    &&
                                    variable.variableType.variableTypeLanguages.map((variableTypeLanguage) =>
                                        <>
                                            {
                                                (variableTypeLanguage.appLanguageCode == language) ?
                                                    <Form.Label>
                                                        {/*
                                                        <h3>{variableTypeLanguage.variableTypeName}</h3>
                                                        <p>{variableTypeLanguage.variableTypeComment}</p>
                                                        */}
                                                    </Form.Label>
                                                    :
                                                    null
                                            }
                                        </>
                                    )
                            }
                        </>
                    )
                }
            </Form>
        );
    }

}

export default VariableList;