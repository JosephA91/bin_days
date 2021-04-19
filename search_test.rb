#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative('search')

class SearchTest < Minitest::Test
  attr_reader :response

  def setup
    search_query = "BEAUFORT STREET"
    @response = Search.find_dwellings(search_query)
  end

  def test_can_return_correct_number_dwellings_for_query
    assert_equal response.count, 4
  end
end
