import React from 'react';
import {Jumbotron, Container} from "react-bootstrap";



class Welcome extends React.Component {

//  S E T T I N G   T H E   S T A T E   F O R   T H E   W E L C O M E   C L A S S
//=====================================================================================================================

    // Will set the default parameters included in the state of the class;
    // Used to store general translations which are not stored in the database
    state = {
        welcomeTitle: '',       // Will declare an empty String for storing WelcomeTitle translation
        welcomeMessage: ''      // Will declare an empty String for storing WelcomeMessage translation
    }

//  C O M P O N E N T   D I D   M O U N T   M E T H O D
//=====================================================================================================================

    // Gets executed while loading the component
    componentDidMount() {
        this.renderWelcomeTitle(this.props.language);   // Will call the renderWelcomeTitle() method declared below
        this.renderWelcomeMessage(this.props.language); // Will call the renderWelcomeMessage() method declared below
    }

//  R E N D E R   T R A N S L A T I O N S   M E T H O D S
//=====================================================================================================================

    // Method responsible for displaying the correct translation of the
    // 'Welcome Title' section based on the language
    renderWelcomeTitle(language) {
        switch(language) {
            case 'en':
                this.setState({welcomeTitle: 'Welcome to STORMRIDER'});
                break;
            case 'is':
                this.setState({welcomeTitle: 'Bulbulbul STORMRIDER'});
                break;
            default:
                break;
        }
    }

    // Method responsible for displaying the correct translation of the
    // 'Welcome Message' section based on the language
    renderWelcomeMessage(language) {
        switch(language) {
            case 'en':
                this.setState({welcomeMessage: 'Welcome message from STORMRIDER'});
                break;
            case 'is':
                this.setState({welcomeMessage: 'Bulbulbul asfgwthyt sadasd STORMRIDER'});
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
                    <h1 className="welcome">{this.state.welcomeTitle}</h1>
                    <p className="welcome-message">{this.state.welcomeMessage}</p>
                </Container>
            </Jumbotron>
        );
    }
}

export default Welcome;
