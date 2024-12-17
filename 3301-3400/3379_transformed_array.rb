# @param {Integer[]} nums
# @return {Integer[]}
def construct_transformed_array(nums)
    nums.map.with_index { |num, i| nums[(i + num) % nums.size] }
end
