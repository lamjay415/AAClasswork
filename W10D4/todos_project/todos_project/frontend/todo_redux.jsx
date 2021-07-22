import { Component } from "react";
import configureStore from "./store/store";
import {root_reducer} from '../frontend/reducers/root_reducer'
import {receive_todos} from './actions/todo_actions'
import {receive_todo} from './actions/todo_actions'
import {remove_todo} from './actions/todo_actions'
import {receive_steps, receive_step, remove_step} from './actions/step_actions';
// import {hot} from "react-hot-loader";
import { Root } from './components/root'
import { allTodos } from "./reducers/selectors"
import ReactDOM from 'react-dom';
import React from 'react';

document.addEventListener('DOMContentLoaded', () =>{
  const store = configureStore();
  let etc = [];
  const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, ...etc }, ...etc];
  const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 2, ...etc }, ...etc];
  
  const rootElement = document.getElementById("rootElement")
  ReactDOM.render(<Root store={store} />, rootElement);
  window.allTodos = allTodos;

  window.newTodos = newTodos;
  window.newSteps = newSteps;
  window.store = store;
  window.receive_todos = receive_todos;
  window.remove_todo = remove_todo;
  window.receive_steps = receive_steps;
  window.receive_step = receive_step;
  window.remove_step = remove_step;

  // console.log('test 1: before ');
  // console.log(store.getState());
  store.dispatch(receive_todos(newTodos));
  store.dispatch(receive_steps(newSteps));
  // console.log('after ');
  // console.log(store.getState()); // should return only the new todos and steps

  // console.log('test 2: before ');
  // console.log(store.getState());
  store.dispatch(receive_todo({ id: 3, title: "New Todo", ...etc }));
  store.dispatch(receive_step({ id: 3, title: "New Step", todo_id: 2, done: false, ...etc }));
  // console.log('after ');
  // console.log(store.getState()); // should include the newly added todo and step

  // console.log('test 3: before ');
  // console.log(store.getState());
  store.dispatch(receive_todo({ id: 3, title: "Newer Todo", ...etc }));
  store.dispatch(receive_step({ id: 3, title: "Newer Step", done: true, ...etc }));
  // console.log('after ');
  // console.log(store.getState()); // should update the previously added todo and step

  // console.log('test 4: before ');
  // console.log(store.getState());
  // store.dispatch(remove_todo({ id: 3, title: "Newer Todo", ...etc }));
  // store.dispatch(remove_step({ id: 3, title: "Newer Step", ...etc }));
  // console.log('after ');
  // console.log(store.getState()); // should not include the previously added todo

});

// Test your code - Import the store to your entry file.Create your store by calling configureStore, set window.store = store in your entry file and then call window.store.getState() in your console.Make sure that this function returns the initial application state described above.Don't move on until it does!