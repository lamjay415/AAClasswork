import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions";



const todos_reducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({},state);
    // debugger;
    switch(action.type){
        case REMOVE_TODO:
            delete nextState[action.todo.id];
            return nextState;
        case RECEIVE_TODOS:
            action.todos.forEach((todo)=> {
                nextState[todo.id] = todo;            
            });
            return nextState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState;
        default: 
            return state;
    }
};

export default todos_reducer;