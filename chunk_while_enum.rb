# Reimplement #chunk?
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 3

numbers = [1,2,4,9,10,11,12,15,16,19,20,21]

def test_chunk(arr)
    arr.chunk_while { |i, j| i.to_i + 1 == j }
end

expected_result = test_chunk(numbers)

def numbers.chunk_while(*args)
    grouping = []
    @all_chunks = []
    previous = nil
    each do |val|
        # if the new yield is different than the previous, save/clear the current
        #   grouping to start a new grouping
        if previous.nil?
            previous = val
            grouping << val
            next
        else
            if !yield(previous, val)
                show_and_clear(grouping)
            end
            grouping << val
            previous = val
        end
    end
    show_and_clear(grouping)
    @all_chunks.each
end

def add_and_break(val)
    @all_chunks << [val]
    @all_chunks.each
end

# Handles adding the current chunk to the rest, and clearing current result
def show_and_clear(grouping)
    puts "#{grouping[0]}, #{grouping[1]}"
    @all_chunks << grouping.dup
    grouping.clear
end

actual_result = test_chunk(numbers)
show_results('test_chunk', expected_result, actual_result)
