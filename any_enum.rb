# Reimplement #any?
DESIRED_LENGTH = 4

ANIMALS_WITH_FOUR = ['cat', 'dog', 'lamb', 'horse']
ANIMALS_WITHOUT_FOUR = ['cat', 'dog', 'lambs', 'horse']

PASSED_MESSAGE = "Test passed"

def validate_length(list)
    list.any? do |element|
        element.length == DESIRED_LENGTH
    end
end

def test_any
    test_with_four
    test_without_four
end

def test_with_four
    actual_result = validate_length(ANIMALS_WITH_FOUR) ?  true : false
    expected_result = true

    show_results('test_with_four', expected_result, actual_result)
end

def test_without_four
    actual_result = validate_length(ANIMALS_WITHOUT_FOUR) ?  true : false
    expected_result = false

    show_results('test_without_four', expected_result, actual_result)
end

def show_results(test_name, expected_result, actual_result)
    if expected_result ==  actual_result
        puts PASSED_MESSAGE
    else
        puts "FAILURE #{test_name}: Expected #{expected_result}, got #{actual_result}."
    end
end

test_any