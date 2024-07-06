# @param {String} s
# @return {Integer}
def remove_palindrome_sub(s)
    l = 0
    r = s.length - 1
    while l < r
        return 2 if s[l] != s[r]
        l += 1
        r -= 1
    end

    1
end
