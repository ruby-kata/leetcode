# @param {String} s
# @param {String} t
# @return {Integer}
def append_characters(s, t)
    i = 0
    j = 0
    while i < s.length && j < t.length
        j += 1 if s[i] == t[j]
        i += 1
    end

    t.length - j
end
