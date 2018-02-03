import { RECEIVE_CARDS } from '../actions/card_actions';

const cardReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action) {
    case RECEIVE_CARDS:
      const nextState = Object.assign({}, state, action.cards);
      console.log(nextState);
      return nextState;
  
    default:
      return state;
  }
};

export default cardReducer;