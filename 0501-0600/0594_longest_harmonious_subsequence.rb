# @param {Integer[]} nums
# @return {Integer}
def find_lhs(nums) # sort + sliding window
    nums.sort!
    
    # since the nums is sorted, 
    # now we only need to maintain the window that has max-min=1 and count
    max = 0
    i = j = 0
    while j < nums.size
        max = [max, j-i+1].max if nums[j] - nums[i] == 1
        i += 1 while i < j && nums[j] - nums[i] > 1
        j += 1
    end

    max
end

# hash-table
def find_lhs(nums)
    counter = nums.tally
    max = 0
    counter.each { |num, count|
        # subsequence of {num} and subsequence of {num + 1} will form a harmonious subsequence
        max = [max, counter[num+1] + count].max if counter.has_key?(num + 1)
    }

    max
end
