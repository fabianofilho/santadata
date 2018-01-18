import React, { Component } from 'react';
import './Home.css';
import NewPatient from './../../components/newPatient/NewPatient';

class Home extends Component {
  
  constructor(props) {
    super(props);

    this.handleClickNewPatient = this.handleClickNewPatient.bind(this);

    this.state = {
      currentSession: <p>home</p>,
    };
  }

  handleClickNewPatient(event) {
    event.preventDefault();
    this.switchSession( <NewPatient /> );
  }

  switchSession(target) {
    this.setState(
      {
        currentSession: target,
      }
    );
  }

  render() {
    return(
      <div className="Home" >
        <h1>Homepage</h1>
        <button onClick={ this.handleClickNewPatient } >
          Novo Paciente
        </button>
        <section>
          { this.state.currentSession }
        </section>

      </div>
    );
  }
}

export default Home;
