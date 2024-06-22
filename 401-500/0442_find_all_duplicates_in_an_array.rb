# You must write an algorithm that runs in O(n) time and uses only constant extra space.

# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
   i = 0
   while i < nums.size
      unless nums[i].zero?
         j = nums[i].abs - 1
         if nums[j] < 0
            if i < j
               nums[i] = nums[i] < 0 ? nums[j] : nums[j].abs
               i -= 1
            end
            nums[j] = 0 # dup
         else
            nums[j] = -nums[j] # first time
         end
      end
      i += 1
   end
 
   nums.map!.with_index { |x, i| x == 0 ? i+1 : nil }.compact!
end
 