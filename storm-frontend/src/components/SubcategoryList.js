import React from 'react';
import SubcategoryListItem from "./SubcategoryListItem";
import { Form } from 'react-bootstrap';


class SubcategoryList extends React.Component {

//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        const language = this.props.language;   // Declares a language variable and assigns the value to it
                                                // passed from the App.js component as 'language'
        return (
            <Form.Group controlId="formBasicCheckbox">
            {
                this.props.subcategories.map((subcategory) =>
                    <SubcategoryListItem
                        subcategory={subcategory}
                        language={language} />
                )
            }
            </Form.Group>
        );
    }

}

export default SubcategoryList;