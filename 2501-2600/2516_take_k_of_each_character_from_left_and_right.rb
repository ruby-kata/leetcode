# @param {String} s
# @param {Integer} k
# @return {Integer}
def take_characters(s, k)
    return 0 if k.zero?
    counter = Hash.new(0).merge(s.chars.tally)
    return -1 if counter['a'] < k || counter['b'] < k || counter['c'] < k

    # + + + <================ left
    # - - - - - - <========== right
    #             + + +
    # a a a a a a a a a
    min = Float::INFINITY
    l = r = 0
    while r < s.length
        # counter contains only removed chars on both side
        # the middle substring between l <-> r is the remain
        counter[s[r]] -= 1
        
        # when not enough
        # removing on left side until enough
        while counter[s[r]] < k
            counter[s[l]] += 1
            l += 1
        end
        min = [min, s.length - (r - l + 1)].min
        r += 1
    end

    min
end
