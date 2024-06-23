# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
    max_len = 0
    i = j = 0
    while i < nums.size
        if nums[i] == 0
            max_len = [max_len, i-j].max
            j = i + 1
        end
        i += 1
    end

    [max_len, i-j].max
end
