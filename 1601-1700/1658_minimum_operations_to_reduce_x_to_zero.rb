# @param {Integer[]} nums
# @param {Integer} x
# @return {Integer}
def min_operations(nums, x)
    min = Float::INFINITY

    prefix_sums = []
    prefix_sum = 0
    (0...nums.size).each do |i|
        prefix_sums.push(prefix_sum += nums[i])
        min = i + 1 if prefix_sum == x && min > i + 1
    end

    suffix_sum = 0
    (nums.size-1).downto(1) do |i|
        r = nums.size - i
        break if r >= min

        suffix_sum += nums[i]
        remain = x - suffix_sum
        break if remain < 0
        
        l = remain == 0 ? -1 : prefix_sums.bsearch_index { |num| remain <=> num }
        min = l + 1 + r if !l.nil? && l < i && min > l + 1 + r
    end

    min == Float::INFINITY ? -1 : min
end
