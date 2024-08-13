# @param {Integer[]} nums
# @return {Integer}
def sum_counts(nums)
    sum = 0
    (0...nums.size).each { |i|
        counter = Hash.new(false)
        d = 0
        (i...nums.size).each { |j|
            d += 1 unless counter[nums[j]]
            counter[nums[j]] = true
            sum += d**2
        }
    }
    
    sum
end
