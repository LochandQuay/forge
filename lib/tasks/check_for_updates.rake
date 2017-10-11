require 'rake'

desc 'Checks current Patch number to determine if update is necessary'
task check_for_updates: :environment do
  puts 'Checking Hearthstone API for latest patch.........'.blue

  response = RestClient::Request.execute(
    method: :get, 
    url: 'https://omgvamp-hearthstone-v1.p.mashape.com/info',
    headers: {
      "X-Mashape-Key" => ENV["HEARTHSTONE_API_KEY"],
      "Accept" => "application/json"
    })

  parsed_response = JSON.parse(response.body)

  puts '...'.white
  puts '...'.white
  puts "\n\n200 OK".green
  current_patch = Patch.last ? Patch.last.patch : 'n/a'
  latest_patch = parsed_response['patch']
  card_sets = parsed_response['sets']

  puts "\n\nForge's Current Patch: #{current_patch.yellow}"
  puts "Current Patch Available: #{latest_patch.yellow}"
  
  if current_patch != latest_patch
    Rake::Task[:update_cards].invoke(latest_patch, card_sets)
  else
    puts "Cards up-to-date!".green
  end
end
