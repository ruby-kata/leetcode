# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_subarray_sum(nums, k)
    return nums.max if k == 1

    max = 0
    sum = 0
    counter = Hash.new(0)
    distinct_count = 0

    (0...k).each { |i|
        sum += nums[i]
        counter[nums[i]] += 1
        distinct_count += 1 if counter[nums[i]] == 1
    }
    
    (k..nums.size).each { |i|
        max = [max, sum].max if distinct_count == k

        counter[nums[i]] += 1
        distinct_count += 1 if counter[nums[i]] == 1
        sum += (nums[i] || 0)

        counter[nums[i-k]] -= 1
        if counter[nums[i-k]] <= 0
            counter.delete(nums[i-k])
            distinct_count -= 1
        end
        sum -= nums[i-k]
    }
    
    max
end
