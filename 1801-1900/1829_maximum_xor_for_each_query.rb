# @param {Integer[]} nums
# @param {Integer} maximum_bit
# @return {Integer[]}
def get_maximum_xor(nums, maximum_bit)
    # since nums[i] < 2**maximum_bit and k < 2**maximum_bit
    # so the XOR result always < 2**maximum_bit
    # that mean the max is 2**maximum_bit - 1
    max = 2**maximum_bit - 1
    prefix_xor = 0
    nums.map { |num|
        prefix_xor ^= num
        # to get the max, we need eliminate the prefix_xor
        # then xor with the max
        # prefix_xor ^ k = max
        # => k = prefix_xor ^ max
        prefix_xor ^ max
    }
    .reverse
end
