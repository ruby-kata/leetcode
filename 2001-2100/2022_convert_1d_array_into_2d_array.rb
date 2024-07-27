# @param {Integer[]} original
# @param {Integer} m
# @param {Integer} n
# @return {Integer[][]}
def construct2_d_array(original, m, n)
    return [] if original.size != m * n

    original.each_slice(n).to_a
end
