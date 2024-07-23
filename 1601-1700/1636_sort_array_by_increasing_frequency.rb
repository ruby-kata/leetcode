# @param {Integer[]} nums
# @return {Integer[]}
def frequency_sort(nums)
    nums.tally.entries.sort { |(num1, count1), (num2, count2)|
        count1 == count2 ? (num2 <=> num1) : (count1 <=> count2)
    }.map { |num, count| 
        Array.new(count, num) 
    }.flatten
end
