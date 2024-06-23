# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
    i = 0
    while i < nums.size
        if nums[i] > 0 && nums[i] <= nums.size && nums[i] != nums[nums[i]-1]
            temp = nums[i]
            nums[i] = nums[temp-1]
            nums[temp-1] = temp
        else
            i += 1
        end
    end

    nums.each_with_index do |num, i|
        return i+1 unless num == i+1
    end

    nums.size + 1
end
