# @param {Integer[]} nums
# @param {Integer[][]} operations
# @return {Integer[]}
def array_change(nums, operations)
    nums_map = Hash.new
    nums.each_with_index do |num, i|
        nums_map[num] = i
    end

    operations.each do |x, y|
        i = nums_map[x]
        nums[i] = y
        nums_map.delete(x)
        nums_map[y] = i
    end

    nums
end
