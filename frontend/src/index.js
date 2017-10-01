import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import {BrowserRouter, Route, Link} from 'react-router-dom';

// COMPONENTS
import App from './app'


class Router extends Component {
  render(){
    return <div>
      <App/>
    </div>
  }
}
ReactDOM.render(
  <BrowserRouter>
    <div>
      <header>
        <Link to="/">Home</Link>
      </header>
        <Route exact path="/" component={Router}></Route>

    </div>
  </BrowserRouter>
  , document.getElementById('root')
  );
  export default Router;
