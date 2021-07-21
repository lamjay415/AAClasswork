import React from 'react'
import ReactDOM from 'react-dom';
import { allTodos } from '../../reducers/selectors';
import { TodoListContainer } from './todo_list_container';
import Todo from '../todos/todo_list_item';

//
export const todoList = (props) => {
    
    let todos = props.todos;
    todos = todos.map((todo) => {
       return <Todo todo={todo} key={todo.id}/>
    });
    return (
    <div>
        <ul key = 'todoList' >
            {todos}
        </ul>
    </div>
)};