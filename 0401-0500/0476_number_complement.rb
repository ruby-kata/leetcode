# @param {Integer} num
# @return {Integer}
def find_complement(num)
    num ^ ((1 << num.bit_length) - 1)
end
