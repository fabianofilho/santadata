import React, { Component } from 'react';
import './Intro.css';

class Intro extends Component {

  constructor(props){
    super(props);
  }

  render() {
    return(
      <div id="Intro">
        <div className="intro-text">
          <div id="SAME-FUCKING-LINE">
            <a>
              <img id="doctor" src='https://plasticsurgeonforkids.com/wp-content/uploads/MAIN-HEADSHOT-Circle1.png' alt='logo' title=""/>
            </a> 
  
            <div className="welcome">
              <h1>Bem vindo,<br/> { this.props.userData.name } </h1>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Intro;
