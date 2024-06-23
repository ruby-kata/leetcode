# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarrays_with_k_distinct(nums, k)
    count = 0
    counter = Hash.new(0)
    diff = 0
    i = j = 0
    prev = 0
    while j < nums.size
        counter[nums[j]] += 1
        diff += 1 if counter[nums[j]] == 1
        
        while diff > k
            counter[nums[i]] -= 1
            if counter[nums[i]].zero?
                diff -= 1
                prev = 0
            end
            i += 1
        end

        while counter[nums[i]] > 1 
            counter[nums[i]] -= 1
            i += 1
            prev += 1
        end

        count += prev + 1 if diff == k

        j += 1
    end

    count
end


def subarrays_with_k_distinct(nums, k)
    def subarrays_with_atmost_k_distinct(nums, k)
        count = 0
        counter = Hash.new(0)
        i = j = 0
        while j < nums.size
            counter[nums[j]] += 1
            while counter.size > k
                counter[nums[i]] -= 1
                counter.delete(nums[i]) if counter[nums[i]] <= 0
                i += 1
            end

            count += j-i+1
            j += 1        
        end

        count
    end

    subarrays_with_atmost_k_distinct(nums, k) - subarrays_with_atmost_k_distinct(nums, k-1)
end
