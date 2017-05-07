import React from 'react';
import { ReactDOM, render } from 'react-dom';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import SpotIndexContainer from './containers/SpotIndexContainer';
import SpotFormContainer from './containers/SpotFormContainer';

const App = (props) => {
  return(
  <Router history={browserHistory}>
    <Route path="/spots" component={SpotIndexContainer} />
    <Route path="/spots/new" component={SpotFormContainer} />
  </Router>
  )
}

export default App;
