import React, {useState} from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import subjectsReducer from './redux/Reducers';
import logo from './logo.svg';
import './App.css';

const store = createStore(subjectsReducer);

function App() {
  return (
    <Provider store={store}>
 
    <div className="App">
      <header className="App-header">
        <div className="HeadBar">
          <p>Geo Search</p>
        </div>

        <div className="Inputs">
        <p>Geo Search</p>
        </div>
        
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
      <footer></footer> 
    </div>


  </Provider>

  );
}

export default App;
