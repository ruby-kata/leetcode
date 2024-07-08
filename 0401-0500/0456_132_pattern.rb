# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
    desc_stack = []
    num_k = -Float::INFINITY
    (nums.size-1).downto(0) do |i|
        return true if nums[i] < num_k

        num_k = desc_stack.pop until desc_stack.empty? || desc_stack.last >= nums[i]
        desc_stack.push(nums[i])
    end
    
    false
end
