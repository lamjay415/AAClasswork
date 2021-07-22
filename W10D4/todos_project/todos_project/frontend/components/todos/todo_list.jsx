import React from 'react'
import ReactDOM from 'react-dom';
import { allTodos } from '../../reducers/selectors';
import { TodoListContainer } from './todo_list_container';
import Todo from '../todos/todo_list_item';
import TodoForm from './todo_form';
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
        <TodoForm receive_todo={props.receive_todo}/>
    </div>
    
)};