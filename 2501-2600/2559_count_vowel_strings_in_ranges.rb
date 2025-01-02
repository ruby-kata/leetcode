# @param {String[]} words
# @param {Integer[][]} queries
# @return {Integer[]}
def vowel_strings(words, queries)
    vowels = 'aeiou'.freeze
    prefix_sum = [0]
    words.each { |word|
        prefix_sum << prefix_sum.last + (vowels.include?(word[0]) && vowels.include?(word[-1]) ? 1 : 0)
    }

    queries.map { |l, r|
        prefix_sum[r+1] - prefix_sum[l]
    }
end
