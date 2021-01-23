import React from 'react';

import {CardColumns, Card, Button, Jumbotron, Container} from "react-bootstrap";
import SubcategoryList from "./SubcategoryList";
import ProductListItem from "./ProductListItem";



class ProductList extends React.Component {

//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        const language = this.props.language;   // Declares a language variable and assigns the value to it
                                                // passed from the App.js component as 'language'
        return (
            <Container>
                <SubcategoryList
                    subcategories={this.props.subcategories}
                    language={language}/>
                <CardColumns className="card-frame">
                    {
                        this.props.subcategories.map((subcategory) =>
                        <>
                        {
                            subcategory.productGroups.map((productGroup) =>
                                <ProductListItem
                                    getProductGroup={this.props.getProductGroup}
                                    productGroup={productGroup}
                                    language={language} />
                            )
                        }
                        </>
                        )
                    }
                </CardColumns>
            </Container>
        );
    }

}

export default ProductList;