# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_subarray_length(nums, k)
    counter =  Hash.new(0)
    max_len = 0
    i = j = 0
    until j >= nums.size
        counter[nums[j]] += 1
        until counter[nums[j]] <= k
            counter[nums[i]] -= 1
            i += 1
        end
        max_len = [max_len, j-i+1].max
        j += 1
    end

    max_len
end
