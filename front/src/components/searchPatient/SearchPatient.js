import React, { Component } from 'react';
import './SearchPatient.css';
import Base64 from './../../lib/base64';
import axios from 'axios';


class SearchPatient extends Component {
  
  constructor(props) {
    super(props);
    
    this.getAllPatients = this.getAllPatients.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    
    this.state = {
      patientsShow: null, // Vetor de Pacientes que devo exibir na tabela
      patientSearch: { // Paciente a ser buscado.
        name: "",
        age: "",
      }
    };
  }
  
  handleChange(event) {
    
    var patient = this.state.patientSearch;
    var value = event.target.value;

    switch(event.target.name) {
      case "patientName":
        patient.name = value;
        break;
      
      default:
        break;
    }
    
    this.setState(
      {
        patient: patient,
      }
    );
  }
  
  getAllPatients() {
    /*user= {this.props.user} */
    var userId = '1/';
    var userhash = 'MTY2Mjg5N2IzY2IyODBjOTA0NjE4M2QwMzg3ZGYzYzk=/';
    
    axios.defaults.baseURL = 'https://31.220.54.251:8443';
    
    axios.post(
      'gen/new/pacient/'+{userId}+'/'+{userhash}, /* this.props.user.id+this.props.user.hash, */
      "data="+Base64.encode({})
    )
    .then(
      function(response) {
        const listPatients = response.data;
      }
    ).catch();
    
    
    return( /* listPatients */
      {
        data: [
          {Name: "Arthur", Id: "55"},{Name: "Arthur Cristo", Id: "58"}
        ],
      }
    );
  }
  
  handleSubmit(event) {
    event.preventDefault();
    
    const listAllPatients = (this.getAllPatients()).data;
    const patient = this.state.patientSearch;
    var patientsList = [];
    
    for(let i = 0; i < listAllPatients.length; i++) {
      
      if(((listAllPatients[i].Name).search(patient.name)) != -1) {
        patientsList.push(listAllPatients[i]);
      }              
    }
    
    this.setState({
      patientsShow: patientsList,
    });
  }
  
  render() {
    return(
      
      <div className="SearchPatient">
        <h1>Busca de Paciente</h1>
        <form onSubmit={ this.handleSubmit } >

          <label htmlFor= "patientName"> Nome </label>
          <input 
            className="patientName"
            type="text"
            id="patientName" 
            name="patientName"
            value={ this.state.patientSearch.name } 
            onChange={ this.handleChange }
          />
      
          <input type="submit" value="Buscar" />
        </form>
      
        <div className="patientList">
          {/*  <PatientList patientsShow={this.state.patientsShow}/>  */}
        </div>
      </div>
    );
  }
}

export default SearchPatient 