import React from 'react';
import { Form } from "react-bootstrap";

class SubcategoryListItem extends React.Component {

//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        const language = this.props.language;   // Declares a language variable and assigns the value to it
                                                // passed from the SubcategoryList.js component as 'language'
        return (
            <>
                {
                    this.props.subcategory.subcategoryLanguages.map((subcategoryLanguage) =>
                        <>
                        {
                            (subcategoryLanguage.appLanguageCode === language) ?
                                <Form.Check type="checkbox" label={subcategoryLanguage.name} />
                                :
                                null
                        }
                        </>
                    )
                }
            </>
        );
    }

}

export default SubcategoryListItem;