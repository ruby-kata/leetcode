# @param {String} word
# @param {Character} ch
# @return {String}
def reverse_prefix(word, ch)
    return word unless i = word.index(ch)
    word[0..i].reverse.concat(word[i+1..])
end
