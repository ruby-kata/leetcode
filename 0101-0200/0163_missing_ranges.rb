# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer[][]}
def missing_ranges(nums, lower, upper)
    return [[lower, upper]] if nums.empty?

    ans = []

    if nums[0] > lower
        ans << [lower, nums[0]-1]
    end

    nums.each_cons(2) { |a, b|
        if a < b-1
            ans << [a+1, b-1]
        end
    }

    if nums[-1] < upper
        ans << [nums[-1]+1, upper]
    end

    ans
end
