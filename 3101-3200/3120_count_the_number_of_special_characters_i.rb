# @param {String} word
# @return {Integer}
def number_of_special_chars(word)
    (counter = word.chars.tally).count { |c, _|
        counter.has_key?(c.swapcase)
    } / 2
end
