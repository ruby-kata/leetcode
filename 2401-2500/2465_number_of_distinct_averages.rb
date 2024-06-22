# @param {Integer[]} nums
# @return {Integer}
def distinct_averages(nums)
    nums.sort!

    counter = Hash.new
    i = 0
    j = nums.size - 1
    while i < j
        average = (nums[i] + nums[j]) / 2.0
        counter[average] = true unless counter.has_key?(average)
        i += 1
        j -= 1
    end

    counter.size
end
