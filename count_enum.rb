# Reimplement #count
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

animals = ['cat', 'dog', 'lamb', 'hors']

def test_count(arr)
    arr.count do |element|
        element << 's'
    end
end

expected_result = test_count(animals)

def animals.count(*args)
    @all_results = []
    each do |val|
        @all_results << yield(val)
    end
    @all_results
end

actual_result = test_count(animals)

show_results('test_count', expected_result, actual_result)
