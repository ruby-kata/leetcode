# @param {String[]} words
# @return {String}
def odd_string(words)
    len = words.first.length
    (1..len).each { |j|
        diff0 = words[0][j].ord - words[0][j-1].ord
        diff1 = words[1][j].ord - words[1][j-1].ord
        if diff0 != diff1
            diff2 = words[2][j].ord - words[2][j-1].ord
            return diff2 == diff1 ? words[0] : words[1]
        end
        (2...words.size).each { |i|
            return words[i] if (words[i][j].ord - words[i][j-1].ord) != diff0
        }
    }
end
