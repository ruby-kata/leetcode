# @param {String} s
# @param {String[]} words
# @return {Integer}
def expressive_words(s, words)
    group = []
    s.chars.each do |c|
        if group.last.nil? || group.last[0] != c
            group << [c, 1]
        else
            group.last[1] += 1
        end
    end

    words.count do |word|
        i = 0
        j = 0
        while i < word.size && j < group.size
            break if word[i] != group[j][0]

            s = i
            i += 1 until word[i+1] != word[i]
            break if (i-s+1 > group[j][1]) || (group[j][1] <= 2 && group[j][1] != i-s+1)

            i += 1
            j += 1
        end

        i == word.size && j == group.size
    end
end
