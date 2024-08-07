# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def min_changes(n, k)
    count = 0
    while n > 0
        n_bit = n & 1
        k_bit = k & 1

        return -1 if n_bit == 0 && k_bit == 1
        count += 1 if n_bit == 1 && k_bit == 0

        n >>= 1
        k >>= 1
    end

    k > 0 ? -1 : count
end
