# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    start = nums.bsearch_index { |num| num > (target-1) }
    return [-1, -1] if start.nil? or nums[start] != target

    [start, (nums.bsearch_index { |num| num > target } || nums.size) - 1]
end
