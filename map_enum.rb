# Reimplement #map
require 'pry'

require_relative 'enum_test_helper'

range = (1..4) 

def test_map(range)
    range.map do |i|
        i * i
    end
end

expected_result = test_map(range)

def (1..4).map
    return enum_for(:map) unless block_given?

    @all_results = []
    each do |val|
        @all_results << yield(val)
    end
    @all_results
end

actual_result = test_map(range)

show_results('test_map', expected_result, actual_result)
