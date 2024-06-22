# @param {String} s
# @return {Integer}
def count_homogenous(s)
    mod = 1000000007
    count = 0
    i = j = 0
    while j < s.length
        if s[j] == s[i]
            j += 1
        else
            len = j - i
            count += (len * (len + 1)) / 2
            count %= mod
            i = j
            j += 1
        end
    end

    len = j - i
    count += (len * (len + 1)) / 2
    count %= mod
end
