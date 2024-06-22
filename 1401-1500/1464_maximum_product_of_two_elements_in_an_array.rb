# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
    largest = nums[0]
    second_largest = nums[1]
    (1...nums.size).each do |i|
        if largest < nums[i]
            second_largest = largest
            largest = nums[i]
        elsif second_largest < nums[i]
            second_largest = nums[i]
        end
    end

    (largest - 1) * (second_largest - 1)
end
