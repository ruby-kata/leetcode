# @param {Integer[]} nums
# @return {Integer}
def maximum_strong_pair_xor(nums)
    nums.sort!

    max_xor = -Float::INFINITY
    (0...nums.size).each { |i|
        j = i
        while j < nums.size && nums[j] <= 2*nums[i]
            max_xor = [max_xor, nums[j] ^ nums[i]].max
            j += 1
        end 
    }

    max_xor
end
