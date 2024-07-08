# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
    require 'set'
    words_set = word_dict.to_set

    dp = Array.new(s.size)
    dp << true
    split_words = ->(i) {
        return dp[i] unless dp[j = i].nil?
        while j < s.size
            return dp[i] = true if words_set.include?(s[i..j]) and split_words.call(j+1)
            j += 1
        end
        dp[i] = false
        false
    }

    split_words.call(0)
end
