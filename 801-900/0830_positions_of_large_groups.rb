# @param {String} s
# @return {Integer[][]}
def large_group_positions(s)
    large_ranges = []
    i = j = 0
    while j <= s.length
        if s[j] != s[i]
            large_ranges << [i, j-1] if j - i > 2
            i = j
        end
        j += 1
    end

    large_ranges
end
