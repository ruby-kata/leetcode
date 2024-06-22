# @param {Integer[]} nums
# @return {Integer}
def max_sum(nums)
    max_nums = Hash.new(0)
    max = -1
    nums.each do |num|
        max_digit = 0
        _num = num
        while _num > 0
            max_digit = _num % 10 if _num % 10 > max_digit
            _num = _num / 10
        end

        max = max_nums[max_digit] + num if max_nums.has_key?(max_digit) && max_nums[max_digit] + num > max
        max_nums[max_digit] = num if max_nums[max_digit] < num
    end

    max
end
