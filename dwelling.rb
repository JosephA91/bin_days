#!/usr/bin/env ruby

require 'date'

class Dwelling
  attr_reader :street_address, :suburb, :state, :postcode, :general_waste_start, :general_waste_frequency, :recycling_waste_start, :recycling_waste_frequency, :green_waste_start, :green_waste_frequency

  def initialize(street_address:, suburb:, state:, postcode:, general_waste_start:, general_waste_frequency:, recycling_waste_start:, recycling_waste_frequency:, green_waste_start:, green_waste_frequency:)
    @street_address = street_address
    @suburb = suburb
    @state = state
    @postcode = postcode
    @general_waste_start = general_waste_start
    @general_waste_frequency = general_waste_frequency
    @recycling_waste_start = recycling_waste_start
    @recycling_waste_frequency = recycling_waste_frequency
    @green_waste_start = green_waste_start
    @green_waste_frequency = green_waste_frequency
  end

  def full_address
    "#{self.street_address} #{self.suburb} #{self.state} #{self.postcode}"
  end

  def next_general_waste_day
    general_waste_dates = (Date.parse(self.general_waste_start)..Date.today).step(self.general_waste_frequency).to_a
    return general_waste_dates.last < Date.today ? general_waste_dates.last + self.general_waste_frequency : general_waste_dates.last
  end

  def next_recycling_day
    recycling_dates = (Date.parse(self.recycling_waste_start)..Date.today).step(self.recycling_waste_frequency).to_a
    return recycling_dates.last < Date.today ? recycling_dates.last + self.recycling_waste_frequency : recycling_dates.last
  end

  def next_green_waste_day
    green_waste_dates = (Date.parse(self.green_waste_start)..Date.today).step(self.green_waste_frequency).to_a
    return green_waste_dates.last < Date.today ? green_waste_dates.last + self.green_waste_frequency : green_waste_dates.last
  end
end
