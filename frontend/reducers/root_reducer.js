import { combineReducers } from 'redux';

import cardReducer from './card_reducer';

const rootReducer = combineReducers({
  cards: cardReducer
});

export default rootReducer;