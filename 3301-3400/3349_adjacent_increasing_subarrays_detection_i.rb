# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def has_increasing_subarrays(nums, k)
    is_increaseing_subarray = lambda { |i, j|
        return true if i == j
        (i+1..j).all? { |x| nums[x] > nums[x-1] }
    }

    double_k = 2 * k
    (0..nums.size-double_k).any? { |i|
        is_increaseing_subarray.(i, i+k-1) && is_increaseing_subarray.(i+k, i+double_k-1)
    }
end

# oprimize
def has_increasing_subarrays(nums, k)
    count = 0
    double_k = 2 * k
    i = 0
    while i < nums.size
        j = i
        max = [nums.size-1, i + double_k - 1].min
        j += 1 while j < max && nums[j+1] > nums[j]
        
        size = j - i + 1
        return true if size >= double_k

        if size >= k
            count += 1
        else
            count = 0
        end

        return true if count == 2

        i = j + 1
    end

    false
end
