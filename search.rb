#!/usr/bin/env ruby

require_relative('dwelling')
require 'json'
json_from_file = File.read("./data/data.json")
ADDRESS_HASH = JSON.parse(json_from_file)

module Search
  def self.find_dwellings(search_query)
    dwellings_array = Array.new
    search_query = search_query.upcase.gsub(/[^0-9a-z ]/i, '')

    dwellings_array = ADDRESS_HASH["addresses"].map do |i|
      dwelling = Dwelling.new(
        street_address: i["street_address"],
        suburb: i["suburb"],
        state: i["state"],
        postcode: i["postcode"],
        general_waste_start: i["general_waste_start"],
        general_waste_frequency: i["general_waste_frequency"],
        recycling_waste_start: i["recycling_waste_start"],
        recycling_waste_frequency: i["recycling_waste_frequency"],
        green_waste_start: i["green_waste_start"],
        green_waste_frequency: i["green_waste_frequency"]
      )
      if dwelling.full_address.include?(search_query)
        dwelling
      end
    end
    return dwellings_array.compact
  end
end
