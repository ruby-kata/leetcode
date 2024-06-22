# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def beautiful_subsets(nums, k)
    def backtrack(i, nums, k, counter)
        return 1 if i == nums.length

        pick = not_pick = 0
        if nums[i] < k || counter[nums[i] - k] == 0
            counter[nums[i]] += 1
            pick = backtrack(i+1, nums, k, counter)
            counter[nums[i]] -= 1
        end
        not_pick = backtrack(i+1, nums, k, counter)
        pick + not_pick
    end

    nums.sort!
    
    backtrack(0, nums, k, Array.new(1001, 0)) - 1
end
