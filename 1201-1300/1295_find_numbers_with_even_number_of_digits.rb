# @param {Integer[]} nums
# @return {Integer}
def find_numbers(nums)
    nums.count do |num|
        digits = 0
        while num > 0
            num = num / 10
            digits += 1
        end

        digits.even?
    end
end
