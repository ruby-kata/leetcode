# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
def longest_subarray(nums, limit)
    max, min = nums[0], nums[0]
    l, r = 0, 0
    longest = 0
    loop do
        d = (max - min).abs
        if d <= limit
            longest = [longest, r - l + 1].max
        else
            l += 1
            max = nums[l..r].max if nums[l-1] == max 
            min = nums[l..r].min if nums[l-1] == min
        end

        r += 1
        break if r >= nums.length

        max = [max, nums[r]].max
        min = [min, nums[r]].min
    end

    longest
end
