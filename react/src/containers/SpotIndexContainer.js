import React from 'react';
import SpotFormContainer from './SpotFormContainer';
import Spot from '../components/spot';

class SpotIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      spots: []
    }
    // this.addNewSpot = this.addNewSpot.bind(this)
  }


  componentDidMount(){
    fetch(`/api/v1/spots`, {
      credentials: 'same-origin',
      method: 'GET'
    })
      .then(response => response.json())
      .then(response => {
        this.setState({ spots: response })
        console.log(response)
      })
  }


  // addNewSpot(spotPayload){
  //   fetch(`/api/v1/spots`, {
  //     method: 'POST',
  //     body: JSON.stringify(spotPayload)
  //   })
  //     .then(response => response.json())
  //     .then(response => {
  //       this.setState({ spots: [...this.state.spots, response] })
  //     })
  // }

  render(){
    let renderSpots = this.state.spots.map(spot => {
      return(
        <Spot
          key={spot.id}
          id={spot.id}
          name={spot.name}
          description={spot.description}
          coordinate={spot.coordinate}
        />
      )
    })
    return(
      <div>
      <div>
        <div className="row small-up-1 medium-up-2 large-up-3">
          {renderSpots}
        </div>
      </div>
      </div>
    )
  }
}

export default SpotIndexContainer;
