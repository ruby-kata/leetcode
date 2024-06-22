# @param {Integer[]} nums
# @return {Integer}
def subset_xor_sum(nums)
    sum_xor = 0
    len = (1 << nums.length) - 1
    (1..len).each do |sub|
        xor_total = 0
        (0...nums.length).each do |i|
            xor_total ^= nums[i] if ((sub >> i) & 1) == 1            
        end
        sum_xor += xor_total
    end

    sum_xor
end

# Math
# O(n)
def subset_xor_sum(nums)
    # suppose nums[i] has j-th bit is 1
    # all 2**(nums.length-1) subsets not include nums[i] will have xor_total is 0 or 1 at the j-th bit
    # if 0, then we add nums[i] into that subset and xor_total become 1
    # if 1, then we not include nums[i]
    # ==> so for every j: there're exactly 2**(nums.length-1) subsets have 1 at the j-th bit
    # ==> sum = sum(j-th-bit * 2**(nums.length-1))
    #

    all_set_bits = nums.inject(&:|)
    all_set_bits * (2**(nums.length-1))
end
