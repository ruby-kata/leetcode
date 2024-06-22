# @param {String} sentence
# @param {String} search_word
# @return {Integer}
def is_prefix_of_word(sentence, search_word)
    if found_index = sentence.split(' ').find_index { |word| word.start_with?(search_word) }
        return found_index + 1
    end
    -1 
end
