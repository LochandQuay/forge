import { RECEIVE_CARDS } from '../actions/card_actions';

const _blankState = {
  byId: {},
  allIds: []
};

const cardReducer = (state = _blankState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CARDS:
      const nextState = Object.assign({}, state, action.cards);
      return nextState;
  
    default:
      return state;
  }
};

export default cardReducer;