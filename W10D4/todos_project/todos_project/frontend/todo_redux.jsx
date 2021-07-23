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
import {fetchTodos} from './util/todo_api_util'

document.addEventListener('DOMContentLoaded', () =>{
  const store = configureStore();
  let etc = [];
  const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, ...etc }, ...etc];
  const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 2, ...etc }, ...etc];
  
  const rootElement = document.getElementById("root")
  ReactDOM.render(<Root store={store} />, rootElement);
  window.allTodos = allTodos;
  window.fetchTodos = fetchTodos;
  window.newTodos = newTodos;
  window.newSteps = newSteps;
  window.store = store;
  window.receive_todos = receive_todos;
  window.remove_todo = remove_todo;
  window.receive_steps = receive_steps;
  window.receive_step = receive_step;
  window.remove_step = remove_step;
  
});

