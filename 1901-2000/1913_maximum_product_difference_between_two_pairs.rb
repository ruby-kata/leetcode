# @param {Integer[]} nums
# @return {Integer}
def max_product_difference(nums)
    max = 0
    second_max = max
    min = Float::INFINITY
    second_min = min

    nums.each do |num|
        if num > max
            second_max = max
            max = num
        elsif num > second_max
            second_max = num
        end

        if num < min
            second_min = min
            min = num
        elsif num < second_min
            second_min = num
        end
    end

    (max * second_max) - (min * second_min)
end
