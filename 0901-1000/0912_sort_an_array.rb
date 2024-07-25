#
# You must solve the problem without using any built-in functions
#

#
# Quick Sort
#
# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums, l = 0, r = nums.size-1)
    return nums if l >= r

    pivot = l
    i = l
    j = r
    loop do
        i += 1 until nums[i] >= nums[pivot]
        j -= 1 until nums[j] <= nums[pivot]
        break pivot = j if i >= j
        
        nums[i], nums[j] = nums[j], nums[i]
        i += 1
        j -= 1
    end

    sort_array(nums, l, pivot)
    sort_array(nums, pivot+1, r)

    nums
end

#
# Counting Sort
#
def sort_array(nums)
    min, max = nums.min, nums.max
    counter = Array.new(max-min+1, 0)
    nums.each do |num|
        counter[num - min] += 1
    end
    (1...counter.size).each do |i|
        counter[i] += counter[i-1]
    end

    sorted = []
    nums.each do |num|
        sorted[counter[num - min] -= 1] = num
    end

    sorted
end


#
# Merge Sort
#
def sort_array(nums)
    merge_sort(nums)
end

def merge_sort(arr, left = 0, right = arr.length-1)
    return arr if left == right

    mid = (left + right)/2
    left_sorted = merge_sort(arr[left..mid])
    right_sorted = merge_sort(arr[mid+1..right])
    merge(left_sorted, right_sorted)
end

def merge(left, right)
    arr = []
    
    i = j = 0
    while i < left.length && j < right.length
        if left[i] <= right[j]
            arr << left[i]
            i += 1
        else
            arr << right[j]
            j += 1
        end
    end

    while i < left.length
        arr << left[i]
        i += 1
    end

    while j < right.length
        arr << right[j]
        j += 1
    end

    arr
end
