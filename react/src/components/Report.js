import React, { Component } from 'react';

class Report extends Component {
  constructor(props) {
    super(props)
  }
  render () {
    return(
      <div class='row'>
        <div class="small-12 large-6 small-centered">
          <div className="column column-block spot-tile">
            <h3>{this.props.body}</h3>
          </div>
        </div>
      </div>
    )
  }
}

export default Report;
