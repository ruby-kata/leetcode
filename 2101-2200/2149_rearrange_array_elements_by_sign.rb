# @param {Integer[]} nums
# @return {Integer[]}
def rearrange_array(nums)
    positives = []
    negatives = []
    nums.each do |num|
        if num >= 0
            positives << num
        else
            negatives << num
        end
    end

    (0...nums.size).map do |i|
        i.even? ? positives.shift : negatives.shift
    end
end
