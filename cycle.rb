# Reimplement #cycle
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

array = ["a", "b", "c"]

def test_cycle(arr)
    arr.cycle(3) do |x|
        puts x
    end
end

expected_result = test_cycle(array)

def array.cycle(*args)
    count = 0
    each do |val|
        # Return enumerator object if no block is given
        return self.each if !block_given?
        # Do nothing if arg is non-positive or collection is empty
        return if args[0] <= 0 || self.length < 1
        # Infinite loop if none or nil is given
        loop { yield(val) } if args.none? || args == nil
        # Loop the specified # of times
        while count < args[0] do 
            yield(val)
            count += 1
        end

    end
    # Returns nil if loop has finished without interruption
    nil
end

actual_result = test_cycle(array)

show_results('test_cycle', expected_result, actual_result)
