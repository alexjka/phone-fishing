import React from 'react';

export default class Spot extends React.Component {
  render () {
    return(
      <div>
        <p>{this.props.id}</p>
        <p>{this.props.name}</p>
        <p>{this.props.description}</p>
        <p>{this.props.coordinate}</p>
      </div>
    )
  }
}
