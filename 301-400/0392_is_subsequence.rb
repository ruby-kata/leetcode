# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
    return true if s.empty?
    return false if t.empty?

    i = 0
    t.each_char do |c|
        return true if s[i] == c && (i += 1) == s.size
    end

    false
end
