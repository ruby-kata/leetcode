# @param {String} word1
# @param {String} word2
# @return {String}
def largest_merge(word1, word2)
    merge = []
    i = 0
    j = 0
    while i < word1.size && j < word2.size
        if word1[i..] >= word2[j..]
            merge << word1[i]
            i += 1
        else
            merge << word2[j]
            j += 1
        end
    end

    merge = merge.join("")
    merge += word1[i..] if i < word1.size
    merge += word2[j..] if j < word2.size

    merge
end
