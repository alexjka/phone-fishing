import React from 'react';

export default class Spot extends React.Component {
  render () {
    return(
      <div className='row'>
        <div className="small-12 large-6 small-centered">
          <div className="column column-block spot-tile">
            <a href={'/spots/'+ this.props.id}>
              <h3>{this.props.name}</h3>
            </a>
          </div>
        </div>
      </div>
    )
  }
}
