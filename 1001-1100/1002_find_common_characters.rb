# @param {String[]} words
# @return {String[]}
def common_chars(words)
    characters_counter = ('a'..'z').map { |c| [c, 0] }.to_h
    words.map { |word|
        characters_counter.merge(word.chars.tally)
    }.inject { |acc, counter|
        ('a'..'z').each { |c|
            acc[c] = [acc[c], counter[c]].min
        }
        acc
    }.map { |c, count| 
        [c] * count 
    }.flatten
end
