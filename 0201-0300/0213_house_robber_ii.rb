# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return nums.first if nums.size == 1
    
    optimal_rob = lambda { |i, j|
        curr_house = next_house = next_next_house = 0
        (j).downto(i) { |k|
            curr_house = [next_house, nums[k] + next_next_house].max
            next_next_house = next_house
            next_house = curr_house
        }

        curr_house
    }

    [optimal_rob.call(0, nums.size-2), optimal_rob.call(1, nums.size-1)].max
end
