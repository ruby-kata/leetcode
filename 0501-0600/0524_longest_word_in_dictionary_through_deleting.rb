# @param {String} s
# @param {String[]} dictionary
# @return {String}
def find_longest_word(s, dictionary)
    match = lambda { |word|
        i = j = 0
        while i < word.length
            j += 1 while j < s.length && s[j] != word[i]
            return false if j >= s.length

            i += 1
            j += 1
        end

        i == word.length
    }
    
    dictionary
        .sort { |w1, w2| 
            w1.length == w2.length ? (w1 <=> w2) : w2.length <=> w1.length }
        .find { |word|
            match.call(word)
        } || ""
end
