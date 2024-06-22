# @param {Integer[]} nums
# @return {Integer}
def count_nice_pairs(nums)
    mod = 1000000007
    count = 0
    sum = Hash.new(0)
    nums.each do |num|
         s = num - num.to_s.reverse.to_i
         count += sum[s]
         count %= mod
         sum[s] += 1
    end
 
    count
 end
 