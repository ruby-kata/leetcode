# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
    pivot = nums.length-1
    pivot -= 1 until pivot <= 0 or nums[pivot] > nums[pivot-1]
 
    l, r = pivot, nums.length-1
    while l < r
     nums[l], nums[r] = nums[r], nums[l]
     l += 1
     r -= 1
    end
 
     if pivot > 0
         swap_index = pivot - 1
         pivot += 1 until nums[pivot] > nums[swap_index]
         nums[swap_index], nums[pivot] = nums[pivot], nums[swap_index]
     end
 end
 