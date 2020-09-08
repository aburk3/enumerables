# Reimplement #chunk?
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 3

animals = ['cat', 'dog', 'lamb', 'horse', 'pig']

def test_chunk(arr)
    arr.chunk_while do |element_before, element_after|
        binding.pry if element_before.nil?
        binding.pry if element_after.nil?
        desired_length?(element_before) && desired_length?(element_after)
    end
end

expected_result = test_chunk(animals)

def animals.chunk_while(*args)
    grouping = []
    @all_chunks = []
    each_with_index do |val, index|
        # binding.pry
        # if the new yield is different than the previous, save/clear the current
        #   grouping to start a new grouping
        element_after = self[index + 1]

        # If we are on the last element, it automatically
        #   is in it's own group
        # binding.pry
        return add_and_break(val) if index == self.length - 1

        # self[index + 1] ? element_after = self[index + 1] : 
        show_and_clear(grouping) if grouping[0] != yield(val, self[index + 1]) && grouping.length > 0
        
        grouping[0] = yield(val) if grouping.length < 1
        grouping[1] ||= []
        grouping[1] << val
    end
    show_and_clear(grouping)
    @all_chunks.each
    # binding.pry
end

def add_and_break(val)
    @all_chunks << [val]
    @all_chunks.each
end

def desired_length?(elem)
    begin
        elem.length == DESIRED_LENGTH
    rescue => exception
        binding.pry        
    end
end


# Handles adding the current chunk to the rest, and clearing current result
def show_and_clear(grouping)
    puts "#{grouping[0]}, #{grouping[1]}"
    @all_chunks << grouping.dup
    grouping.clear
end

actual_result = test_chunk(animals)
show_results('test_chunk', expected_result, actual_result)
