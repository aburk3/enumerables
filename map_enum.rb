# Reimplement #map
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

animals = ['cat', 'dog', 'lamb', 'hors']

def test_map(arr)
    arr.map do |element|
        element << 's'
    end
end

expected_result = test_map(animals)

def animals.map(*args)
    @all_results = []
    each do |val|
        @all_results << yield(val)
    end
    @all_results
end

actual_result = test_map(animals)

show_results('test_map', expected_result, actual_result)
