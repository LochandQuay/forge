require 'rake'
require 'csv' # needed?

desc 'Updates Card Sets to track Standard rotation'
task :update_card_sets, [:patch, :card_sets] => :environment do |t, args|
    puts "Updating Hearthstone card sets....\n"

    page = Nokogiri::HTML(open('https://hearthstone.gamepedia.com/Card_set'))
    # finds first table element on page
    card_sets = page.at('table') 
    # gets data from table, excluding headers
    set_rows = card_sets.search('td') 
    # strips Standard and Wild from table data (only ones with rowspan attr)
    set_rows = set_rows.reject { |row| row.attributes.has_key?('rowspan')}.map(&:content)
    # selects headers of table and removes Format column (for Standard and Wild only)
    table_headers = card_sets.search('th').map(&:content).drop(1)


    # TODO: organize data so columns align
    # TODO: create csv from data?
    # NOTE: maybe there's a way to zip each header with a data set?
end