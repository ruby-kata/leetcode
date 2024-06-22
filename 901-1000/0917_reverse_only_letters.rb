# @param {String} s
# @return {String}
def reverse_only_letters(s)
    l = 0
    r = s.length - 1
    while l < r
        l += 1 until l >= r or (s[l] >= 'a' && s[l] <= 'z') or (s[l] >= 'A' && s[l] <= 'Z')
        r -= 1 until r <= l or (s[r] >= 'a' && s[r] <= 'z') or (s[r] >= 'A' && s[r] <= 'Z')
        break if l >= r
    
        s[l], s[r] = s[r], s[l]
        l += 1
        r -= 1
    end

    s
end
