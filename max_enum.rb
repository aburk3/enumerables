# Reimplement #max
require 'pry'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-max

DESIRED_LENGTH = 4

my_array = %w(albatross dog horse)

def test_max(my_array)
    my_array.max
end

expected_result = test_max(my_array)

def my_array.max(*args)
    max_element = nil
    each do |element|
        max_element ||= element
        max_element = element if new_element_is_greater(max_element, element)
    end
    max_element
end

def new_element_is_greater(max_element, new_element)
    index = 0
    iterable_max_element = max_element.split("")
    iterable_new_element = new_element.split("")

    iterable_max_element.each do |char|

        max_element_bytes = char.bytes[0]
        new_element_bytes = iterable_new_element[index].bytes[0]

        return true if max_element_bytes < new_element_bytes
        index += 1
    end
    false
end

actual_result = test_max(my_array)

show_results('test_max', expected_result, actual_result)
