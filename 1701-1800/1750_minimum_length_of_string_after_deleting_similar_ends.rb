# @param {String} s
# @return {Integer}
def minimum_length(s)
    l = 0
    r = s.size - 1
    while l < r
        break if s[l] != s[r]

        l += 1 until s[l+1] != s[r]
        r -= 1 until s[r-1] != s[l]

        l += 1
        r -= 1
    end

    r >= l ? r-l+1 : 0
end
