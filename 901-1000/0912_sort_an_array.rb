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
