# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} multiplier
# @return {Integer[]}
def get_final_state(nums, k, multiplier)
    k.times do
        i = nums.index(nums.min)
        nums[i] *= multiplier
    end

    nums
end
