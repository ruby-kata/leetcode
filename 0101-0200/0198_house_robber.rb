# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    curr_house = next_house = next_next_house = 0
    (nums.size-1).downto(0) { |i|
        curr_house = [next_house, nums[i] + next_next_house].max
        next_next_house = next_house
        next_house = curr_house
    }

    curr_house
end
