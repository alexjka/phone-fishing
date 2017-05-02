
import React from 'react';
import { ReactDOM, render } from 'react-dom';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import SpotIndexContainer from './containers/SpotIndexContainer';

const App = (props) => {
  return(
    <Router history={browserHistory}>
    <Route path="/" component={SpotIndexContainer} />
    <Route path="/spots/new" component={SpotFormContainer} />
  </Router>

  )
}

export default App;
