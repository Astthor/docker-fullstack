import React from 'react';
import logo from '../header-logo.png'

import {Navbar, Nav, Button, Form, FormControl} from "react-bootstrap";
import {Link} from 'react-router-dom';
import axios from "axios";


class NavBar extends React.Component {

//  S E T T I N G   T H E   S T A T E   F O R   T H E   N A V - B A R   C L A S S
//=====================================================================================================================

    // Will set the default parameters included in the state of the class;
    // Used to store general translations which are not stored in the database
    state = {
        aboutUs: '',       // Will declare an empty String for storing AboutUs translation
    }

//  C O M P O N E N T   D I D   M O U N T   M E T H O D
//=====================================================================================================================

    // Gets executed while loading the component
    componentDidMount() {
        this.renderAboutUs(this.props.language);   // Will call the renderAboutUs() method declared below
    }

//  R E N D E R   T R A N S L A T I O N S   M E T H O D S
//=====================================================================================================================

    // Method responsible for displaying the correct translation of the
    // 'About Us' section based on the language
    renderAboutUs(language) {
        switch(language) {
            case 'en':
                this.setState({aboutUs: 'About Us'});
                break;
            case 'is':
                this.setState({aboutUs: 'Um Okkur'});
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
            <Navbar expand="lg" bg="dark" variant="dark">
                <Link className="navbar-brand" to={"/"}><img src={logo} width="150"/></Link>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="mr-auto">
                    <>
                    {
                        this.props.categories.map((category) =>
                        <>
                        {
                            category.categoryLanguages.map((categoryLanguage) =>
                            <>
                            {
                                (categoryLanguage.appLanguageCode === language) ?
                                    <Link
                                        onClick={this.props.getSubcategoryByCategoryId.bind(this, category.categoryId)}
                                        className="nav-link"
                                        to="product-list">
                                        {categoryLanguage.name}
                                    </Link>
                                :
                                null
                            }
                            </>
                            )
                        }
                        </>
                        )
                    }
                    </>
                    <Link className="nav-link" to={"about-us"}>{this.state.aboutUs}</Link>
                </Nav>
                <Form inline>
                    <Button
                        onClick={this.props.changeLanguage.bind(this, language)}
                        variant="outline-light" >
                        Change Language
                    </Button>
                </Form>
                </Navbar.Collapse>
            </Navbar>

        );
    }
}

export default NavBar;