# @param {Integer[]} nums
# @return {Integer[]}
def get_sum_absolute_differences(nums)
    result = Array.new(nums.size, 0)
    result[0] = 0

    (1...nums.size).each do |i|
        result[i] = result[i-1] + i * (nums[i] - nums[i-1])
    end

    suffix_sum = 0
    (nums.size-2).downto(0).each do |j|
        suffix_sum += (nums[j+1] - nums[j]) * (nums.size - j - 1)
        result[j] += suffix_sum
    end

    result
end
