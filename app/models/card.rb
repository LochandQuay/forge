class Card < ApplicationRecord
  def default_url
    "http://vignette2.wikia.nocookie.net/hearthstone/images/c/c4/Card_back-Default.png/revision/latest?cb=20140823204025"
  end

  def displayable_attributes
    [
      'name', 'card_set', 'card_type', 'faction', 'rarity', 'cost',
      'attack', 'health', 'armor', 'text', 'collectible', 'race',
      'player_class', 'how_to_get', 'how_to_get_gold',
      'durability'
    ].select { |attr| self[attr] }
  end

  def img_urls
    img_gold ? [img, img_gold] : [img || default_url]
  end
end