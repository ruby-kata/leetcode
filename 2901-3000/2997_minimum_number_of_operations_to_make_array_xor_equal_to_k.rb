# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
    xor = nums.inject(&:^)
    count = 0
    while k > 0 or xor > 0
        count += 1 if (k & 1) != (xor & 1)
        k >>= 1
        xor >>= 1
    end

    count
end
