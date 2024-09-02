# @param {String} s
# @param {Integer} k
# @return {Integer}
def count_k_constraint_substrings(s, k)
    count = 0
    k0 = k1 = k
    i = j = 0
    while j < s.length
        k0 -= 1 if s[j] == '0'
        k1 -= 1 if s[j] == '1'

        while k0 < 0 && k1 < 0
            k0 += 1 if s[i] == '0'
            k1 += 1 if s[i] == '1'
            i += 1
        end

        count += j - i + 1
        j += 1
    end

    count
end
