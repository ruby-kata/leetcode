# @param {Integer} n
# @param {Integer} start
# @return {Integer}
def xor_operation(n, start)
    n.times.reduce(0) { |acc, i| acc ^= (start + 2*i) }
end
