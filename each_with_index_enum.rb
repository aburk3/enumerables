# Reimplement #each_with_index
require 'pry'

require_relative 'enum_test_helper'

my_arr = %w(cat dog wombat)

def test_each_with_index(arr)
    hash = Hash.new

    arr.each_with_index do |item, index|
      hash[item] = index
    end
    hash
end

expected_result = test_each_with_index(my_arr)

def my_arr.each_with_index
  return enum_for(:each_with_index) unless block_given?

  count = 0
  self.each do |element|
    yield element, count
    count += 1
  end
end

actual_result = test_each_with_index(my_arr)

show_results('test_each_with_index', expected_result, actual_result)
