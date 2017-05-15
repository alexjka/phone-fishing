import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import app from './app';

$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );
});
