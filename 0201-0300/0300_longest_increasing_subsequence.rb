# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    order = [nums.shift]
    nums.each do |num|
        firstGreaterIndex = order.bsearch_index { |x| x >= num } || order.size
        order[firstGreaterIndex] = num
    end

    order.size
end
