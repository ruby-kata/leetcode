# @param {Integer} n
# @return {Integer[]}
def sum_zero(n)
    arr = []
    if n.odd?
        arr << 0
        n -= 1
    end
    
    l = -1
    r = 1
    while n > 0
        arr << l
        arr << r
        l -= 1
        r += 1
        n -= 2
    end

    arr
end
