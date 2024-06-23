# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
    min = Float::INFINITY
    second_min = Float::INFINITY
    nums.each do |num|
        return true if num > second_min 
        if num <= min
            min = num
        elsif num <= second_min
            second_min = num
        end
    end
    false
end
