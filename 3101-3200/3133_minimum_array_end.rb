# @param {Integer} n
# @param {Integer} x
# @return {Integer}
def min_end(n, x)
    # Assune we have n numbers such that AND of all of them results in x.
    # num1: 1...1...1.1.1.1.1..1
    # num2: 1...1...1.1.1.1.1..1
    # ...
    #    x: 10001000101010101001
    #
    # First of all, each number must have bit-set at every position where x has a bit-set,
    # since if any of them has 0 at any those positions, the AND result will differ from x.
    #
    # Second, the minimum of those n numbers must be >= x,
    # because if the minimum < x, then there's a position (corresponding to a bit-set position at x) where the bit is 0,
    # causing the AND result to be different from x.
    #
    # Therefore, the smallest number in this series should start from x,
    # and we can generate the n-1 other numbers by toggling some 0 from right to left (to get as small as posible).
    #
    # After toggling n-1 0's we will get the minimum end.
    ans = x
    mask = n - 1
    (0...x.bit_length+n.bit_length).each { |i|
        if 0 == ((x >> i) & 1)
            ans |= (1 << i) if (mask & 1) == 1
            mask >>= 1
        end
    }

    ans
end
