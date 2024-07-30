# @param {String} s
# @return {Integer}
def minimum_deletions(s)
    # at the index i
    # ...........(a|b)...
    # [  balanced  ]
    # assume that [0..i-1] is balanced by removing some 'a'/'b'
    # there're 3 ways to make [0..i] is also balanced:
    # - [1] if 'a' at i then: 
    #     + [1.1] we remove some 'a'/'b' same as [0..i-1] above and remove the 'a' at i
    #     + [1.2] remove all 'b', let 'a' only
    # - [2] if 'b' at i, we remove some 'a'/'b' same as [0..i-1] above, and keep 'b' at i
    #

    ans = 0 # number of removing some 'a'/'b' so far
    b_count = 0 # number of prefix 'b' so far
    s.each_char { |c|
        if c == 'b'
            b_count += 1
            # case [2], keep b, the ans so far is still optimal
        else
            # min of case [1.1] and case [1.2]
            ans = [ans + 1, b_count].min
        end
    }
    ans
end
