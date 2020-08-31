# Reimplement #chunk?
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 3

animals = ['cat', 'dog', 'lamb', 'horse', 'pig']

def test_chunk(arr)
    arr.chunk do |element|
        element.length == DESIRED_LENGTH
    end
end

expected_result = test_chunk(animals)

def animals.chunk(*args)
    grouping = []
    @all_chunks = []
    each do |val|
        # if the new yield is different than the previous, save/clear the current
        #   grouping to start a new grouping
        show_and_clear(grouping) if grouping[0] != yield(val) && grouping.length > 0
        
        grouping[0] = yield(val) if grouping.length < 1
        grouping[1] ||= []
        grouping[1] << val
    end
    show_and_clear(grouping)
    @all_chunks.each
end

# Handles adding the current chunk to the rest, and clearing current result
def show_and_clear(grouping)
    puts "#{grouping[0]}, #{grouping[1]}"
    @all_chunks << grouping.dup
    grouping.clear
end

actual_result = test_chunk(animals)
show_results('test_chunk', expected_result, actual_result)
