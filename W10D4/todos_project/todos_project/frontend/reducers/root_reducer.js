import { combineReducers } from "redux";
import todos_reducer from "./todos_reducer";
import steps_reducer from "./steps_reducer";

const rootReducer = combineReducers({
    todos: todos_reducer,
    steps: steps_reducer
});

export default rootReducer;