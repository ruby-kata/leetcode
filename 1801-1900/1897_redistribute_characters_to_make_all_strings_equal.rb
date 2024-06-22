# @param {String[]} words
# @return {Boolean}
def make_equal(words)
    counter = words.join("").chars.tally
    counter.all? { |c, count| count % words.size == 0 }
end
