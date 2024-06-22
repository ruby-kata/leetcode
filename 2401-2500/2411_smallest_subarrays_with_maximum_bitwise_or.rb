# @param {Integer[]} nums
# @return {Integer[]}
def smallest_subarrays(nums)
    max = Array.new(nums.size, 1)
    max_bits_len = Math.log2(10**9).ceil
    bit1_to_index = Array.new(max_bits_len, -1)

    (nums.size-1).downto(0) do |i|
        (0...max_bits_len).each do |j|
            bit1_to_index[j] = i if ((nums[i] >> j) & 1) == 1
            max[i] = [max[i], bit1_to_index[j] - i + 1].max if bit1_to_index[j] > -1
        end
    end

    max
end
