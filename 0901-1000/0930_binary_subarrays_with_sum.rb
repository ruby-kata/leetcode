# @param {Integer[]} nums
# @param {Integer} goal
# @return {Integer}
def num_subarrays_with_sum(nums, goal)
    count = 0
    prefix_sums = Hash.new(0)
    prefix_sums[0] = 1
    sum = 0
    nums.each do |num|
        sum += num
        count += prefix_sums[sum - goal] if sum >= goal
        prefix_sums[sum] += 1
    end

    count
end
