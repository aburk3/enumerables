# Reimplement #max_by
require 'pry'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-max_by

DESIRED_LENGTH = 4

my_array = %w(albatross dog horse onomonopias)

def test_max_by(my_array)
    result = my_array.max_by(2) do |e|
        e.length
    end
    puts result
end

puts "=====   FIRST TEST   ====="
expected_result = test_max_by(my_array)

def my_array.max_by(*args)
    return enum_for(:max_by) unless block_given?

    if args.length == 0
        max_element = nil
        each do |element|
            max_element ||= element

            max_element = element if (yield element) > (yield max_element)
        end
        max_element
    else
        count = 1
        max_elements = []
        arr_size = args[0]
        each do |element|
            if count < arr_size[0]
                max_elements << element
                next
            end
            max_elements.each_with_index do |element, index|
                TODO:
            end

            max_elements = element if (yield element) > (yield max_elements)
            count += 1
        end
        max_elements
    end
end

# TODO: Determine whether to sort while appending or #sort_by at end
def add_to_array(current_arr, new_element)
    current_arr.each do |element|
        current_arr.unshift(new_element, element)
    end
end

puts "=====   SECOND TEST   ====="
actual_result = test_max_by(my_array)

show_results('test_max_by', expected_result, actual_result)


# history[count] = { 
#     'element': element,
#     'value': yield element
# }