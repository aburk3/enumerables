# Reimplement #sort_by
require 'pry'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-sort_by

my_arr = ['Banana', 'Apple', 'Mango', 'Apple', 'Passionfruit', 'Pineapple']

def test_sort_by(arr)
  result = arr.sort_by do |word|
    word.length
  end
  puts result
end

# Test before overwriting sort_by method
expected_result = test_sort_by(my_arr)

def my_arr.sort_by
  return enum_for(:sort_by) unless block_given?

  new_arr = []
  greatest = nil
  copy_original = self.dup
  while copy_original.any? # Could use alternative method here
    greatest_index = 0
    copy_original.each_with_index do |word, index|
      greatest ||= word
      greatest_w_block = yield greatest
      word_w_block = yield word
      if swap?(greatest_w_block, word_w_block)
        greatest = word
        greatest_index = index
      end
    end
    new_arr << greatest
    copy_original.delete_at(greatest_index)

    greatest = nil
    greatest_index = nil
  end
  new_arr
end

def swap?(newest, greatest)
  result = newest <=> greatest
  return true if result == 1
  false
end



# Test after overwriting sort_by method
actual_result = test_sort_by(my_arr)

# Comparing results
show_results('test_sort_by', expected_result, actual_result)
