# Reimplement #all?
MAX_LENGTH = 4

ANIMALS = ['cat', 'dog', 'lamb', 'horse']

# TODO: Needs to handle a block and not just
# a 'list'
def validate_length(list)
    result = false
    list.each do |element|
        if element.length <= MAX_LENGTH
            result = true
            next
        else
            result = false
            break
        end
    end
    result
end

def test_all
    passed_message = "Test passed."
    failed_message = "Test failed, horse has 5 chars."
    message = validate_length(ANIMALS) ?  passed_message : failed_message
    puts message
end

test_all