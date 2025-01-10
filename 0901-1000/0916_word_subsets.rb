# @param {String[]} words1
# @param {String[]} words2
# @return {String[]}
def word_subsets(words1, words2)
    words2_max_freq = Hash.new(0)
    words2.each { |word|
        word.chars.tally.each { |c, count|
            words2_max_freq[c] = [words2_max_freq[c], count].max
        }
    }

    words1.select { |word|
        word1_freq = word.chars.tally
        words2_max_freq.all? { |c, max_count|
            word1_freq.has_key?(c) && word1_freq[c] >= max_count
        }
    }
end
