import React from 'react';
import NameField from '../components/NameField';
import LatField from '../components/LatField';
import LongField from '../components/LongField';
import DescriptionField from '../components/DescriptionField';

class SpotFormContainer extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      spotName: "",
      spotDescription: "",
      spotLat: "",
      spotLong: "",
      spots: []
    }
    this.handleNameFieldChange = this.handleNameFieldChange.bind(this);
    this.handleLatFieldChange = this.handleLatFieldChange.bind(this);
    this.handleLongFieldChange = this.handleLongFieldChange.bind(this);
    this.handleDescriptionFieldChange = this.handleDescriptionFieldChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleFormClear = this.handleFormClear.bind(this);
    this.addNewSpot = this.addNewSpot.bind(this)
  }

  componentDidMount(){
    fetch(`/api/v1/spots`, {
      credentials: 'same-origin',
      method: 'GET'
    })
      .then(response => response.json())
      .then(response => {
        this.setState({ spots: response })
      })
  }

  addNewSpot(spotPayload){
    fetch(`/api/v1/spots`, {
      credentials: 'same-origin',
      method: 'POST',
      headers: {  'Accept': 'application/json', 'Content-type': 'application/json' },
      body: JSON.stringify(spotPayload)
    })
      .then(response => response.json())
      .then(response => {
        this.setState({ spots: [...this.state.spots, response] })
      })
  }


  handleNameFieldChange(event) {
  this.setState({ spotName: event.target.value });
  }

  handleLatFieldChange(event) {
  this.setState({ spotLat: event.target.value });
  }

  handleLongFieldChange(event) {
  this.setState({ spotLong: event.target.value });
  }

  handleDescriptionFieldChange(event) {
  this.setState({ spotDescription: event.target.value });
  }

  handleFormSubmit(event){
    event.preventDefault();
    let formPayload = {
      // id: this.state.spotnextId,
      name: this.state.spotName,
      lat: this.state.spotLat,
      long: this.state.spotLong,
      description: this.state.spotDescription
    }
    console.log(formPayload)
    this.addNewSpot(formPayload)
    this.setState({
      spotName: "",
      spotLat: "",
      spotLong: "",
      spotDescription: ""
    });
  }

  handleFormClear(event){
    event.preventDefault();
    this.setState({
      spotName: "",
      spotLat: "",
      spotLong: "",
      spotDescription: ""
    });
  }
  render(){
    return(
      <form className="new-spot-form callout" onSubmit={this.handleFormSubmit}>
        <NameField
          content={this.state.spotName}
          label="Spot Name"
          name="spot-name"
          handleChange={this.handleNameFieldChange}
        />
        <LatField
          content={this.state.spotLat}
          label="Spot Latitude"
          name="spot-lat"
          handleChange={this.handleLatFieldChange}
        />
        <LongField
          content={this.state.spotLong}
          label="Spot Longitude"
          name="spot-long"
          handleChange={this.handleLongFieldChange}
        />
        <DescriptionField
          content={this.state.spotDescription}
          label="Spot Description"
          name="spot-description"
          handleChange={this.handleDescriptionFieldChange}
        />
        <div className="button-group">
          <button className="button" onClick={this.handleFormClear}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default SpotFormContainer;
