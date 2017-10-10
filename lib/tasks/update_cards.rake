require 'rake'

task :update_cards => :environment do
  cards = Card.all


  response = RestClient::Request.execute(
  method: :get,
  url: 'https://omgvamp-hearthstone-v1.p.mashape.com/cards/EX1_116',
  headers: {
    "X-Mashape-Key" => "H7cTVoRmvYmsh2BlB4EiXsR3T6Frp146VamjsnZ251gp5WuQI7"
  })

  # Array of card JSON objects
  parsed_response = JSON.parse(response)

  parsed_response.each do |card|
    new_card = {}
    mechanics = nil

    # set up new card column names
    card.each do |k, v|
      if k == 'mechanics'
        mechanics = v
        next
      end

      # skip over currently ignored column names
      
      if k == 'type'
        new_card['card_type'] = v
      else
        next if !(Card.column_names.include?(k.underscore))
        new_card[k.underscore] = v
      end
    end 

    debugger
    Card.create!(new_card)
  end 


  # JSON.parse(response.body)[0].each {|k, v| leeroy_hash[k.underscore == 'type' ? 'card_type' : k.underscore] = v}




  # products.each do |product|
  #   puts "Calculating average rating for #{product.name}..."
  #   product.update_attribute(:average_rating, product.reviews.average("rating"))
  # end
end