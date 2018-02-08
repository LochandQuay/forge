import React from 'react';
import { connect } from 'react-redux';
import { getCards } from '../../actions/card_actions';

const mapStateToProps = (state, ownProps) => ({
  cards: Object.values(state.cards.byId)
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  getCards: () => dispatch(getCards())
});

class CardIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.getCards();
  }

  render() {
    const cards = this.props.cards.map(card => (
      <li key={`card-item-${card.id}`}>
        <img src={`${card.img}`} alt={`${card.name}`} />
      </li>
    ));

    return (
      <div>
        <h3>Card Index</h3>
        <ul>
          { cards }
        </ul>

      </div>
    );
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(CardIndex);