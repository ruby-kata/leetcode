# @param {String} s
# @param {String} t
# @param {Integer} max_cost
# @return {Integer}
def equal_substring(s, t, max_cost)
    max_len = 0
    sum = 0
    i = j = 0
    while j < s.length
        sum += (s[j].ord - t[j].ord).abs
        while sum > max_cost
            sum -= (s[i].ord - t[i].ord).abs
            i += 1
        end
        j += 1
        max_len = [max_len, j - i].max
    end

    max_len
end
