# @param {Integer[]} nums
# @return {Integer}
def minimum_cost(nums)
    # we have to pick the first one
    first = nums[0]
    # to get min-cost we need to pick 2 minimum from [1...nums.size] to divide 2 sub-arrays
    second = Float::INFINITY
    third = Float::INFINITY
    nums[1..].each { |num|
        if num < second
            third = second
            second = num
        elsif num < third
            third = num
        end
    }

    first + second + third
end
