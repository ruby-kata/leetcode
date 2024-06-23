def find_median_sorted_arrays(nums1, nums2)
    longer, shorter = nums1.length > nums2.length ? [nums1, nums2] : [nums2, nums1]
    
    bs_left = 0
    bs_right = shorter.length
    divide_1 = 0
    divide_2 = 0
    until bs_left > bs_right
        divide_1 = (bs_left + bs_right) / 2
        divide_2 = (longer.length + shorter.length + 1) / 2 - divide_1
        if divide_1 < bs_right && longer[divide_2 - 1] > shorter[divide_1]
            bs_left = divide_1 + 1
        elsif divide_1 > bs_left && shorter[divide_1 - 1] > longer[divide_2]
            bs_right = divide_1 - 1
        else
            break
        end
    end
    
    max_left = divide_1 == 0 ? longer[divide_2 - 1] : (divide_2 == 0 ? shorter[divide_1 - 1] : [shorter[divide_1 - 1], longer[divide_2 - 1]].max)
    return max_left if (longer.length + shorter.length)%2 == 1

    min_right = [(shorter[divide_1] || Float::INFINITY), (longer[divide_2] || Float::INFINITY)].min
    return (max_left + min_right)/2.0
end
