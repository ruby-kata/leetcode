# @param {Integer[]} nums
# @param {Integer} pivot
# @return {Integer[]}
def pivot_array(nums, pivot)
    low = []
    high = []
    pivots = []
    nums.each { |num|
        if num == pivot
            pivots << num
        elsif num > pivot
            high << num
        else
            low << num
        end
    }

    low + pivots + high
end

# 2 pointers
def pivot_array(nums, pivot)
    re_arrange = Array.new(nums.size, pivot)
    i = 0
    j = nums.size - 1
    (0...nums.size).each { |k|
        if nums[-k-1] > pivot
            re_arrange[j] = nums[-k-1]
            j -= 1
        end

        if nums[k] < pivot 
            re_arrange[i] = nums[k]
            i += 1
        end
    }

    re_arrange
end



