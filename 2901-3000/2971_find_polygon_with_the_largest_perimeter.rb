# @param {Integer[]} nums
# @return {Integer}
def largest_perimeter(nums)
    nums.sort!

    max = -1
    sum = 0
    nums.each do |num|
        max = sum + num if sum > num
        sum += num
    end

    max
end
