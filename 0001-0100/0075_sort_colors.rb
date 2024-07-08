# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
    zero = one = -1
    (0...nums.length).each { |i|
        if nums[i] == 0
            zero += 1
            one += 1
            nums[zero], nums[one] = nums[one], nums[zero]
            nums[zero], nums[i] = nums[i], nums[zero] if i > one
        elsif nums[i] == 1
            one += 1
            nums[i], nums[one] = nums[one], nums[i]
        end
    }
end
