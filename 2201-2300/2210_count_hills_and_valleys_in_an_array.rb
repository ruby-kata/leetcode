# @param {Integer[]} nums
# @return {Integer}
def count_hill_valley(nums)
    count = 0
    prev = nums.first
    (1...nums.size-1).each do |i|
         if (nums[i] < prev && nums[i] < nums[i+1]) || (nums[i] > prev && nums[i] > nums[i+1])
             count += 1
             prev = nums[i]
         elsif nums[i] != nums[i+1]
             prev = nums[i]
         end
    end
 
    count
 end
 