# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
    return 0 if n == 1 || k == 1

    flag = 0
    len = 2 << (n-1)
    until len == 1
        if k > len/2
            flag = 1 - flag
            k -= len/2
        end
        len >>= 1
    end

    flag
end
