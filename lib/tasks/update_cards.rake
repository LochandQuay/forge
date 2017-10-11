require 'rake'

desc 'Updates existing and adds new cards to database'
task :update_cards, [:patch, :card_sets] => :environment do |t, args|
  puts "Updating Hearthstone cards to Patch #{args.patch.yellow}\n.....\n"

  log = ActiveSupport::Logger.new('log/update_cards.log')
  start_time = Time.now
  log.info "Task started at #{start_time}"

  args.card_sets.each do |set|
    encoded_set = URI.encode(set)

    begin
      puts "Requesting #{set.magenta} Cards........."
      response = RestClient::Request.execute(
        method: :get,
        url: "https://omgvamp-hearthstone-v1.p.mashape.com/cards/sets/#{encoded_set}",
        headers: {
          "X-Mashape-Key" => ENV["HEARTHSTONE_API_KEY"]
        })
    rescue RestClient::ExceptionWithResponse => err
      puts "Request for #{set.magenta} resulted in #{err.to_s.red}"
      puts "See log for details.".white
      log.info "Request for #{set} failed with an error of #{err}."
    else
      puts "#{response.code}".green
      # Array of card JSON objects
      parsed_response = JSON.parse(response.body)
      
      parsed_response.each do |card|
        card_params = {}
        mechanics = nil
    
        # set up new card column names
        card.each do |k, v|
          if k == 'mechanics'
            mechanics = v
            next
          end
          
          if k == 'type'
            card_params['card_type'] = v
          else
            begin 
              k.underscore
            rescue NoMethodError => e
              log.info "Error converting column name: #{e.message}"
            else
              # skip over currently ignored column names
              next if !(Card.column_names.include? k.underscore)
              card_params[k.underscore] = v
            end
          end
        end 
    
        existing_card = Card.find_by(card_id: card_params['card_id'])
        begin
          if existing_card
            existing_card.update_attributes!(card_params)
          else
            new_card = Card.new(card_params)
            new_card.save!
          end
        rescue Exception => e
          log.info "Insert/Update of #{card_params['name']} [#{set}] failed: #{e.message}"
        end

      end 
      puts "#{set.magenta} Cards Saved!"
    end

  end
  
  Patch.create!(patch: args.patch)
  puts "Update to Patch #{args.patch.yellow} Complete!".green

  end_time = Time.now
  duration = (start_time - end_time) / 1.minute
  log.info "Task finished at #{end_time} and last #{duration} minutes."
  log.close
end

  # response = RestClient::Request.execute(
  #   method: :get,
  #   url: 'https://omgvamp-hearthstone-v1.p.mashape.com/cards/',
  #   headers: {
  #     "X-Mashape-Key" => "H7cTVoRmvYmsh2BlB4EiXsR3T6Frp146VamjsnZ251gp5WuQI7"
  #   })