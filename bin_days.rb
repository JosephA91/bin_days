#!/usr/bin/env ruby

require_relative('search')
search_prompt = "Search for an address (e.g. '## BEAUFORT STREET WEST TOODYAY WA 6566')"

puts search_prompt
search_query = gets.chomp

while search_query
  search_query.strip!
  if search_query.upcase.eql?("EXIT")
    exit
  else
    response = Search.find_dwellings(search_query)
    if response.any?
      puts ""
      puts "****** Results Count: #{response.count} ******"
      puts ""
      response.each do |i|
        puts i.full_address
        puts "Your next general waste day is:"
        puts i.next_general_waste_day.strftime("%A, %d %B %Y")
        puts "Your next recycling day is:"
        puts i.next_recycling_day.strftime("%A, %d %B %Y")
        puts "Your next green waste day is:"
        puts i.next_green_waste_day.strftime("%A, %d %B %Y")
        puts ""
      end
    else
      puts "No results found, please try again."
    end
    puts search_prompt
    search_query = gets.chomp
  end
end
