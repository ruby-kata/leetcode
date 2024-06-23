# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
    return 0 if n.zero?
    count = 1
    count += 1 until (n &= n-1) == 0
    count
end
