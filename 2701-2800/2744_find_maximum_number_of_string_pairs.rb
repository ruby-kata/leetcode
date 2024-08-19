# @param {String[]} words
# @return {Integer}
def maximum_number_of_string_pairs(words)
    count = 0
    counter = Hash.new(0)
    words.each { |word|
        count += counter[word]
        counter[word.reverse] += 1
    }

    count
end
