# @param {String} word1
# @param {String} word2
# @return {Boolean}
def close_strings(word1, word2)
    word1_counter = word1.chars.tally
    word2_counter = word2.chars.tally

    word1_counter.keys.sort == word2_counter.keys.sort &&
        word1_counter.values.sort == word2_counter.values.sort
end
