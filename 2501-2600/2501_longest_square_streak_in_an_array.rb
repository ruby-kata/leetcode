# @param {Integer[]} nums
# @return {Integer}
def longest_square_streak(nums)
    nums.sort!
    
    counter = Hash.new(0)
    nums.each { |num|
        counter[num.to_f] = 1 + counter[Math.sqrt(num)]
    }

    longest = counter.values.max
    longest > 1 ? longest : -1
end
