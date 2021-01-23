import React from 'react';
import {Link} from 'react-router-dom';
import { Card, Button } from "react-bootstrap";
import bridle from '../images/products/bridle.png'
import horseshoes from '../images/products/horseshoes.jpg'
import saddle1 from '../images/products/saddle1.png'
import saddle2 from '../images/products/saddle2.jpg'

class ProductListItem extends React.Component {

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
        console.log(this.props);
        const productGroup = this.props.productGroup;
        const language = this.props.language;   // Declares a language variable and assigns the value to it
                                                // passed from the ProductList.js component as 'language'
        return (
            <Card style={{width: '18rem'}}>
                <Card.Img variant="top" style={{height: '20rem'}} src={this.getImage(productGroup.productGroupImage.image)} />
                <Card.Body>
                    {
                        productGroup.productGroupLanguages.map((productGroupLanguage) =>
                            <>
                            {
                                (productGroupLanguage.appLanguageCode == language) ?
                                    <div>
                                        <Card.Text className="card-title">{productGroupLanguage.productGroupName}</Card.Text>
                                        <Card.Text className="card-description">{productGroupLanguage.productGroupDescription}</Card.Text>
                                    </div>
                                    :
                                    null
                            }
                            </>
                        )
                    }
                    <Card.Text className="card-description">Price: {productGroup.basePrice + productGroup.vat}</Card.Text>
                    <Link
                        onClick={this.props.getProductGroup.bind(this, productGroup)}
                        variant="outline-dark"
                        className="btn btn-outline-dark"
                        to="product-details">
                        Product Details
                    </Link>
                </Card.Body>
            </Card>
        );
    }

}

export default ProductListItem;