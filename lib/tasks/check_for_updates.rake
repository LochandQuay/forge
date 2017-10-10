require 'rake'

desc 'Checks current Patch number to determine if update is necessary'
task check_for_updates: :environment do
  puts 'Checking Hearthstone API for latest patch.........'

  response = RestClient::Request.execute(
    method: :get, 
    url: 'https://omgvamp-hearthstone-v1.p.mashape.com/info',
    headers: {
      "X-Mashape-Key" => "H7cTVoRmvYmsh2BlB4EiXsR3T6Frp146VamjsnZ251gp5WuQI7",
      "Accept" => "application/json"
    })
  puts '...'
  puts '...'
  puts "\n\n200 OK"
  current_patch = Patch.last ? Patch.last.patch : 'n/a'
  latest_patch = JSON.parse(response.body)['patch']
  
  puts "\n\nForge's Current Patch: #{current_patch}"
  puts "Current Patch Available: #{latest_patch}"
  
  if current_patch != latest_patch
    Rake::Task[:update_cards].invoke(latest_patch)
  end
end
