import { todoList } from './todo_list';
import { connect } from 'react-redux';
import { allTodos } from '../../reducers/selectors';
import { receive_todo } from '../../actions/todo_actions';
import React from 'react'
import ReactDOM from 'react-dom';

const mapDispatchToProps = (dispatch) => {
    return ({
        receive_todo: (todo) => dispatch(receive_todo(todo))
    })
}

const mapStateToProps = (state) => {
    return ({
        todos: allTodos(state)
    })
}

const createConnectedComponent = connect(
    mapStateToProps,
    mapDispatchToProps
);

export const TodoListContainer = createConnectedComponent(todoList);