import React from 'react';
import {Container, Jumbotron} from "react-bootstrap";



class AboutUs extends React.Component {

//  S E T T I N G   T H E   S T A T E   F O R   T H E   A B O U T - U S   C L A S S
//=====================================================================================================================

    // Will set the default parameters included in the state of the class;
    // Used to store general translations which are not stored in the database
    state = {
        aboutUsTitle: '',       // Will declare an empty String for storing AboutUsTitle translation
        aboutUsMessage: ''      // Will declare an empty String for storing AboutUsMessage translation
    }

//  C O M P O N E N T   D I D   M O U N T   M E T H O D
//=====================================================================================================================

    // Gets executed while loading the component
    componentDidMount() {
        this.renderAboutUsTitle(this.props.language);   // Will call the renderAboutUsTitle() method declared below
        this.renderAboutUsMessage(this.props.language); // Will call the renderAboutUsMessage() method declared below
    }

//  R E N D E R   T R A N S L A T I O N S   M E T H O D S
//=====================================================================================================================

    // Method responsible for displaying the correct translation of the
    // 'About Us Title' section based on the language
    renderAboutUsTitle(language) {
        switch(language) {
            case 'en':
                this.setState({aboutUsTitle: 'The story of STORMRIDER'});
                break;
            case 'is':
                this.setState({aboutUsTitle: 'Um Okkur STORMRIDER'});
                break;
            default:
                break;
        }
    }

    // Method responsible for displaying the correct translation of the
    // 'About Us Message' section based on the language
    renderAboutUsMessage(language) {
        switch(language) {
            case 'en':
                this.setState({aboutUsMessage: 'Message about STORMRIDER'});
                break;
            case 'is':
                this.setState({aboutUsMessage: 'Bulbulbul asfgwthyt STORMRIDER'});
                break;
            default:
                break;
        }
    }




//  R E N D E R   M E T H O D
//=====================================================================================================================

    render() {
        return (
            <Jumbotron>
                <Container>
                    <h1 className="welcome">{this.state.aboutUsTitle}</h1>
                    <p className="welcome-message">{this.state.aboutUsMessage}</p>
                </Container>
            </Jumbotron>
        );
    }
}

export default AboutUs;