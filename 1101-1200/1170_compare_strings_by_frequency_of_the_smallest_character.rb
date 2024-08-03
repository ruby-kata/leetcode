# @param {String[]} queries
# @param {String[]} words
# @return {Integer[]}
def num_smaller_by_frequency(queries, words)
    f = lambda { |str|
        count = 0
        curr = 'z'
        str.each_char { |c|
            if curr == c
                count += 1
            elsif curr.ord > c.ord
                curr = c
                count = 1
            end
        }
        count
    }

    word_sorted = words.map { |word| f.call(word) }.sort

    ans = []
    queries.each { |q|
        freq = f.call(q)
        if i = word_sorted.bsearch_index { |w_freq| w_freq > freq }
            ans << (word_sorted.length - i)
        else
            ans << 0
        end
    }

    ans
end
