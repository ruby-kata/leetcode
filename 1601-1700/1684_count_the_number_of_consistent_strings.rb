# @param {String} allowed
# @param {String[]} words
# @return {Integer}
def count_consistent_strings(allowed, words)
    allowed_chars = allowed.chars
    words.count { |word| (word.chars.uniq - allowed_chars).empty? }
end

def count_consistent_strings(allowed, words)
    words.grep(/^[#{allowed}]*$/).count
end
