# Reimplement #detect
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

list = (1..10)

def test_detect(arr)
    arr.detect do |x|
        x % 2 == 0
    end
end

expected_result = test_detect(list)

def list.detect(ifnone = nil)
    # If no block is given, an enumerator is returned instead.
    return enum_for(:detect) unless block_given?
    each do |val|
        # Returns the first for which block is not false.
        return val if yield(val)
    end
    # If no object matches, calls ifnone and returns its result when it is specified
    return send(ifnone) if ifnone
    # or returns nil otherwise.
    nil
end

actual_result = test_detect(list)

show_results('test_detect', expected_result, actual_result)
