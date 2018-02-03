import { fetchCards } from '../util/card_api_util';

export const RECEIVE_CARDS = 'RECEIVE_CARDS';

export const receiveCards = cards => ({
  type: RECEIVE_CARDS,
  cards
});

export const getCards = () => dispatch => (
  fetchCards().then(cards => dispatch(receiveCards(cards)))
);

window.getCards = getCards;