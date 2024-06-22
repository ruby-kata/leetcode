# @param {String[]} words
# @param {Character[]} letters
# @param {Integer[]} score
# @return {Integer}
def max_score_words(words, letters, score)
    def can_take?(word_tally, counter)
        word_tally.all? { |c, count| counter.has_key?(c) && counter[c] >= count }
    end

    def take(word_tally, counter, score)
        word_tally.inject(0) { |sum, (c, count)|
            counter[c] -= count
            sum += count * score[c.ord - 97]
        }
    end

    def release(word_tally, counter)
        word_tally.each { |c, count|
            counter[c] += count
        }
    end

    def backtrack(i, words_tally, counter, score)
        return 0 if i == words_tally.size

        taken = skip = 0
        if can_take?(words_tally[i], counter)
            s = take(words_tally[i], counter, score)
            taken = s + backtrack(i+1, words_tally, counter, score)
            release(words_tally[i], counter)
        end
        skip = backtrack(i+1, words_tally, counter, score)
        [taken, skip].max
    end

    words_tally = words.map { |w| w.chars.tally }
    counter = letters.tally
    backtrack(0, words_tally, counter, score)
end
