# Reimplement #all?
MAX_LENGTH = 4

ANIMALS = ['cat', 'dog', 'lamb', 'horse']

def validate_length(list)
    list.all? do |element|
        element.length <= MAX_LENGTH
    end
end

def test_all
    passed_message = "Test passed."
    failed_message = "Test failed, horse has 5 chars."
    message = validate_length(ANIMALS) ?  passed_message : failed_message
    puts message
end

test_all