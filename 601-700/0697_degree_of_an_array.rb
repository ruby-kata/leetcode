# @param {Integer[]} nums
# @return {Integer}
def find_shortest_sub_array(nums)
    first_indexes = Hash.new(0)
    freq = Hash.new(0)
    max_freq = 0
    min_len = Float::INFINITY

    (0...nums.size).each do |i|
        first_indexes[nums[i]] = i unless first_indexes.has_key?(nums[i])

        if (freq[nums[i]] += 1) > max_freq
            max_freq = freq[nums[i]]
            min_len = i - first_indexes[nums[i]] + 1
        elsif freq[nums[i]] == max_freq
            min_len = [min_len, i - first_indexes[nums[i]] + 1].min
        end
    end

    min_len
end
