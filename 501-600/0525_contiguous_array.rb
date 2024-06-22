# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
    max = 0
    prefix_sum_first_indexes = Hash.new
    prefix_sum_first_indexes[0] = -1
    prefix_sum = 0
    (0...nums.size).each do |i|
        prefix_sum += nums[i] == 0 ? -1 : 1
        if prefix_sum_first_indexes.has_key?(prefix_sum)
            max = [max, i - prefix_sum_first_indexes[prefix_sum]].max
        else
            prefix_sum_first_indexes[prefix_sum] = i
        end
    end

    max
end
