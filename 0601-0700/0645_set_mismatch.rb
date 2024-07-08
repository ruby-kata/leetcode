# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
    dup = nil
    sum = 0
    (0...nums.size).each do |i|
        num_abs = nums[i].abs
        if nums[num_abs - 1] < 0
            dup = num_abs
        else
            nums[num_abs - 1] *= -1
        end

        sum += num_abs
    end

    [dup, ((nums.size) * (nums.size + 1) / 2) - sum + dup]
end
