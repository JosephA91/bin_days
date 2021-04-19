#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative('dwelling')

class DwellingTest < Minitest::Test
  attr_reader :dwelling

  def setup
    @dwelling = Dwelling.new(
      street_address: "39 BEAUFORT STREET",
      suburb: "WEST TOODYAY",
      state: "WA",
      postcode: 6566,
      general_waste_start: "03/04/2017",
      general_waste_frequency: 7,
      recycling_waste_start: "03/04/2017",
      recycling_waste_frequency: 14,
      green_waste_start: "10/04/2017",
      green_waste_frequency: 14
    )
  end

  def test_can_return_full_address
    assert_equal dwelling.full_address, "39 BEAUFORT STREET WEST TOODYAY WA 6566"
  end

  def test_can_return_next_general_waste_day
    assert dwelling.next_general_waste_day
  end

  def test_can_return_next_recycling_day
    assert dwelling.next_recycling_day
  end

  def test_can_return_next_green_waste_day
    assert dwelling.next_green_waste_day
  end

  def test_can_return_dwelling_attributes
    assert_equal dwelling.street_address, "39 BEAUFORT STREET"
    assert_equal dwelling.suburb, "WEST TOODYAY"
    assert_equal dwelling.state, "WA"
    assert_equal dwelling.postcode, 6566
    assert_equal dwelling.general_waste_start,  "03/04/2017"
    assert_equal dwelling.general_waste_frequency, 7
    assert_equal dwelling.recycling_waste_start, "03/04/2017"
    assert_equal dwelling.recycling_waste_frequency, 14
    assert_equal dwelling.green_waste_start, "10/04/2017"
    assert_equal dwelling.green_waste_frequency, 14
  end
end
