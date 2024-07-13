# @param {String} s
# @param {String[]} words
# @return {Boolean}
def is_prefix_string(s, words)
    i = 0
    j = 0
    while i < s.length && j < words.length
        if s[i...i+words[j].length] == words[j]
            i += words[j].length
            j += 1
        else
            return false
        end
    end

    i == s.length && j <= words.length
end
