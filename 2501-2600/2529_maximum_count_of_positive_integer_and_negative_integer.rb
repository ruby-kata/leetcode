# @param {Integer[]} nums
# @return {Integer}
def maximum_count(nums)
    first_pos_index = nums.bsearch_index { |num| num > 0 } || nums.size
    first_non_neg_index = nums.bsearch_index { |num| num >= 0 } || nums.size
 
    [nums.size - first_pos_index, first_non_neg_index].max
 end
 