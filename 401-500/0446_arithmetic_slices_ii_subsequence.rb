# @param {Integer[]} nums
# @return {Integer}
def number_of_arithmetic_slices(nums)
    count = 0
    # suffix_sum[i][d] is the number of all arithmetic subsequences with differnce d from 0->i
    # and the last element of those sequence must be the nums[i]
    suffix_sum = Array.new(nums.size) { Hash.new(0) }
    
    (0...nums.size).each do |i|
        (0...i).each do |j|
            d = nums[i] - nums[j]
            count += suffix_sum[j][d]
            suffix_sum[i][d] += suffix_sum[j][d] + 1
        end
    end

    count
end
