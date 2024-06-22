# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def largest_sum_after_k_negations(nums, k)
    nums.sort!

    sum = 0
    i = 0
    min = 0
    while i < nums.length
        if nums[i] < 0 && k > 0
            sum += -nums[i]
            min = -nums[i]
            k -= 1
        else
            sum += nums[i]
            min = i > 0 ? [nums[i-1].abs, nums[i].abs].min : nums[i]
            break
        end

        i += 1
    end

    sum -= 2 * min if k.odd?
    sum += nums[i+1..].sum if i < nums.length
    sum
end
