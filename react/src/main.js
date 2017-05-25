import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Project from './Project';

$(function() {
  ReactDOM.render(
    <Project />,
    document.getElementById('app')
  );
});
