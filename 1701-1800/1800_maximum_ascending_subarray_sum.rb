# @param {Integer[]} nums
# @return {Integer}
def max_ascending_sum(nums)
    max = 0
    sum = 0
    prev = 0

    nums.each do |num|
        if num > prev
            sum += num
        else
            max = sum if max < sum
            sum = num
        end

        prev = num
    end

    max = sum if max < sum
    max
end
