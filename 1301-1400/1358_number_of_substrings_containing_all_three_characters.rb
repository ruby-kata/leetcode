# @param {String} s
# @return {Integer}
def number_of_substrings(s)
    count = 0
    last_indexes = [-1,-1,-1]
    (0...s.length).each { |i|
        last_indexes[s[i].ord - 97] = i
        count += last_indexes.min + 1
    }

    count
end
