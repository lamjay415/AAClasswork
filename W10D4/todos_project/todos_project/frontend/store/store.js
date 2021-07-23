import rootReducer from '../reducers/root_reducer';
import {createStore} from 'redux';
import thunk from '../frontend/middleware/thunk'

const configureStore = (preloadedState = {}) => {
    return createStore(rootReducer, preloadedState)
}



export default configureStore;
