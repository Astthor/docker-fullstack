import React from 'react';
import {Container, Row, Col, Image, Form, Card} from "react-bootstrap";
import bridle from "../images/products/bridle.png";
import horseshoes from "../images/products/horseshoes.jpg";
import saddle1 from "../images/products/saddle1.png";
import saddle2 from "../images/products/saddle2.jpg";
import VariableList from "./VariableList";

class ProductDetails extends React.Component {

//  M E T H O D   T O   R E T R I E V E   I M A G E
//=====================================================================================================================

    // TEMPORARY method for the correct image retrieval
    getImage(link) {
        switch(link) {
            case 'bridle.png':
                return bridle;
                break;
            case 'horseshoes.jpg':
                return horseshoes;
                break;
            case 'saddle1.png':
                return saddle1;
                break;
            case 'saddle2.jpg':
                return saddle2;
                break;
            default:
                break;
        }
    }




//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        const language = this.props.language;   // Declares a language variable and assigns the value to it
                                                // passed from the App.js component as 'language'
        return (
            <Container>
                <Row>
                    <Col md='5' sm={{ offset: 1 }}>
                        <Image rounded
                            src={this.getImage(this.props.productGroup.productGroupImage.image)}
                           width={360}
                           height={400}
                           alt="360x400"/>
                    </Col>
                  <Col md='5'>
                    <Form>
                    {
                        this.props.productGroup.productGroupLanguages.map((productGroupLanguage) =>
                            <>
                            {
                                (productGroupLanguage.appLanguageCode == language) ?
                                    <div>
                                        <h1>{productGroupLanguage.productGroupName}</h1>
                                        <p>{productGroupLanguage.productGroupDescription}</p>
                                        {
                                            (this.props.productGroup.products.map((product) =>
                                                <VariableList
                                                    language={language}
                                                    variables={product.variables} />
                                                /*
                                                    product.variables.map((variable) =>
                                                        <>
                                                        {
                                                            variable.variableType.variableTypeLanguages.map((variableTypeLanguage) =>
                                                                <>
                                                                {
                                                                    (variableTypeLanguage.appLanguageCode == language) ?
                                                                        <>
                                                                            <p>{variableTypeLanguage.variableTypeName}</p>
                                                                            <p>{variableTypeLanguage.variableTypeComment}</p>
                                                                        </>
                                                                        :
                                                                        null
                                                                }
                                                                </>
                                                            )
                                                        }
                                                        </>
                                                    )
                                                */
                                            ))
                                        }
                                    </div>
                                    :
                                    null
                            }
                            </>
                        )
                    }
                    </Form>
                  </Col>
                </Row>
            </Container>
        );
    }

}

export default ProductDetails;