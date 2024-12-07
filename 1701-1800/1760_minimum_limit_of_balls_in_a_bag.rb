# @param {Integer[]} nums
# @param {Integer} max_operations
# @return {Integer}
def minimum_size(nums, max_operations)
    low = 1
    high = nums.max
    while low < high
        m = (low + high) / 2
        operations_count = split_count(nums, m)
        if operations_count > max_operations
            low = m + 1
        else
            high = m
        end
    end

    low
end

def split_count(nums, max)
    nums.reduce(0) { |sum, num|
        # 6/3 = 2 but only one split operation
        sum += (num - 1)/max
    }
end
