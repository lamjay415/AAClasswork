import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";

const steps_reducer = (state = [], action) => {
    Object.freeze(state);
    let nextState = Object.assign({},state);

    switch(action.type){
        case REMOVE_STEP:
            delete nextState[action.step.id];
            return nextState;
        case RECEIVE_STEPS:
            action.steps.forEach((step) => {
                nextState[step.id] = step;
            });
            return nextState;
        case RECEIVE_STEP:
            nextState[action.step.id] = action.step;
            return nextState;
        default:
            return state;
    }

}

export default steps_reducer;