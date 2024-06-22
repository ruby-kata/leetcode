# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
    counter = Hash.new(0).merge(p.chars.tally)
    indexes  = []
    i = j = len = 0
    while i < s.size
        len += 1 if (counter[s[i]] -= 1) >= 0

        while len == p.size
            indexes << j if i - j + 1 == p.size
            len -= 1 if (counter[s[j]] += 1) > 0
            j += 1
        end

        i += 1
    end

    indexes
end
