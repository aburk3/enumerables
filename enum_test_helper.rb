PASSED_MESSAGE = "Test passed"

def show_results(test_name, expected_result, actual_result)
    if expected_result.class == Enumerator
        expected_result = expected_result.to_a
        actual_result = actual_result.to_a
    end
    
    if expected_result ==  actual_result
        puts PASSED_MESSAGE
    else
        puts "FAILURE #{test_name}: Expected #{expected_result}, got #{actual_result}."
    end
end

def raise_exception(expected: nil, received: nil)
    raise "Expected #{expected} but received #{received.class}" 
end