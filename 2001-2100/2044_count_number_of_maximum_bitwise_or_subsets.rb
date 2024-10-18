# @param {Integer[]} nums
# @return {Integer}
def count_max_or_subsets(nums)
    max_or = nums.reduce(&:|)
    count = 0
    backtrack = lambda { |sum_or, i|
        if i == nums.size
            count += 1 if sum_or == max_or
            return
        end

        backtrack.call(sum_or, i + 1)
        backtrack.call(sum_or | nums[i], i + 1)
    }

    backtrack.call(0, 0)
    count
end
