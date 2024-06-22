# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    single = 0
    (0..32).each do |i|
        sum_set_bits = nums.inject(0) do |sum, num|
            sum + ((num >> i) & 1)
        end
        single |= ((sum_set_bits % 3) << i)
    end

    [single].pack("i").unpack("i")[0]
end
