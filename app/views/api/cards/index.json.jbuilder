json.byId do 
    @cards.each do |card|
        json.set! card.id do
            json.extract! card, :id, :card_id, :name, :card_set, :card_type, :faction, :rarity, :cost, :attack, :health,
                :armor, :text, :race, :player_class, :img, :img_gold, :durability
        end
    end
end
json.allIds @cards.pluck(:id)