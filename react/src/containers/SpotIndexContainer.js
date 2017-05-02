import React from 'react';
import SpotFormContainer from './SpotFormContainer';
import Spot from '../components/Spot';

class SpotIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      spots: []
    }
    this.addNewSpot = this.addNewSpot.bind(this)
  }

  componentDidMount(){
    fetch(`api/v1/spots`)
      .then(response => response.json())
      .then(response => {
        this.setState({ spots: response })
      })
  }

  addNewSpot(releasePayload){
    fetch(`api/v1/spots`, {
      method: 'POST',
      body: JSON.stringify(spotPayload)
    })
      .then(response => response.json())
      .then(response => {
        this.setState({ spots: [...this.state.spots, response] })
      })

  }

  render(){
    let renderSpots = this.state.spots.map(spot => {
      return(
        <Spot
        key={spot.id}
        id={spot.id}
        title={spot.title}
        coordinate={spot.coordinate}
        description={spot.description}
        />
      )
    })
    return(
      <div>
      <div className="row small-up-1 medium-up-2 large-up-3">
        {renderSpots}
      </div>
    </div>
    )
  }
}

export default SpotIndexContainer;
