import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import React, { Component } from 'react';

import {Container, Row, Col} from "react-bootstrap";
import {BrowserRouter as Router, Switch, Route, Link} from 'react-router-dom'
import axios from "axios";

import Welcome from "./components/Welcome";
import NavBar from "./components/NavBar";
import ProductList from "./components/ProductList";
import AboutUs from "./components/AboutUs";
import ProductDetails from "./components/ProductDetails";


class App extends Component {

//  S E T T I N G   T H E   S T A T E   F O R   T H E   A P P   C L A S S
//=====================================================================================================================

    // Will set the default parameters included in the state of the class
    state = {
        categories: [],     // Will declare an empty array for storing Categories
        subcategories: [],
        productGroup: '',
        language: 'en'      // Will declare a String with a default value of 'en' for storing language
    }

//  C O M P O N E N T   D I D   M O U N T   M E T H O D
//=====================================================================================================================

    // Gets executed while loading the component
    componentDidMount() {
        this.getAllCategories();    // Will call the getAllCategories() method declared below
    }

//  M E T H O D S
//=====================================================================================================================

    // Gets all categories from the database by using axios
    getAllCategories() {
        axios.get("http://localhost:8888/api/category/all") // Will execute the get request from the backend
            .then(response => response.data)                    // Will read the response of the request
            .then((data) => {
                this.setState({categories : data});    // Will insert the data from the response into a
            })                                              // categories array declared as one of the state parameters
    }

    // Gets all subcategories from a selected category by its ID
    getSubcategoryByCategoryId = (categoryId) => {
        (this.state.categories.map((category) =>    // Maps through the 'categories' array set as the state of the class
            (category.categoryId === categoryId) ?  // Checks whether the category ID matches the selected one
                this.setState({subcategories: category.subcategories})  // Fills 'subcategories' array from the state
                : null                                                       // of this class with data from 'categories'
        ))
    }

    getProductGroup = (productGroup) => {
        this.setState({productGroup: productGroup})
    }

    changeLanguage = (language) => {
        console.log(language);
        switch(language) {
            case 'en':
                this.setState({language: 'is'});
                break;
            case 'is':
                this.setState({language: 'en'});
                break;
            default:
                break;
        }
    }



//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        return (
            <Router>
                <NavBar
                    categories={this.state.categories}
                    language={this.state.language}
                    getSubcategoryByCategoryId={this.getSubcategoryByCategoryId}
                    getProductGroup={this.getProductGroup}
                    changeLanguage={this.changeLanguage} />
                <Container>
                    <Row>
                        <Col>
                            <Switch>
                                <Route exact path="/">
                                    <Welcome
                                        language={this.state.language} />
                                </Route>
                                <Route exact path="/about-us">
                                    <AboutUs
                                        language={this.state.language} />
                                </Route>
                                <Route path="/product-list">
                                    <ProductList
                                        getProductGroup={this.getProductGroup}
                                       subcategories={this.state.subcategories}
                                       language={this.state.language} />
                                </Route>
                                <Route path="/product-details">
                                    <ProductDetails
                                        productGroup={this.state.productGroup}
                                        language={this.state.language} />
                                </Route>
                            </Switch>
                        </Col>
                    </Row>
                </Container>
            </Router>
        );
    }
}

export default App;
