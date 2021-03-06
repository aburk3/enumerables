# Reimplement #chain?
require 'pry'

require_relative 'enum_test_helper'

SPREAD = (1..3)
array_to_chain = [4,5]

def test_chain(arr)
    SPREAD.chain(arr)
end

expected_result = test_chain(array_to_chain)

def SPREAD.chain(arr)
    combined = SPREAD.to_a + arr
    combined.each
end

actual_result = test_chain(array_to_chain)

show_results('test_chain', expected_result, actual_result)
