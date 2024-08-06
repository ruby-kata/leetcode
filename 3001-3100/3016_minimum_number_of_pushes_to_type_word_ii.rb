# @param {String} word
# @return {Integer}
def minimum_pushes(word)
    counter = word.chars.tally
    sorted = counter.values.sort
    sorted.reverse.each_with_index.reduce(0) { |sum, (count, i)|
        sum += (i/8 + 1) * count
    }
end
