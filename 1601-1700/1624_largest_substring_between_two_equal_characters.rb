# @param {String} s
# @return {Integer}
def max_length_between_equal_characters(s)
    max = -1
    char_first_indexes = {}
    (0...s.size).each do |i|
        if char_first_indexes.key?(s[i])
            first_index = char_first_indexes[s[i]]
            max = i - first_index - 1 if i > first_index && max < i - first_index - 1
        else
            char_first_indexes[s[i]] = i
        end
    end

    max
end
