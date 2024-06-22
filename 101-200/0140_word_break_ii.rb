# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
    dict = {}
    word_dict.each { |word|
        dict[word] = true
    }

    sentences = Array.new(s.length+1) { [] }
    sentences[s.length] = [[]]

    (s.length-1).downto(0) { |i|
        (i...s.length).each { |j|
            word = s[i..j]
            if dict.has_key?(word)
                sentences[i] += sentences[j+1].map { |sentence|
                    [word] + sentence
                }
            end
        }
    }

    sentences[0].map { |sentence| sentence.join(" ") }
end
