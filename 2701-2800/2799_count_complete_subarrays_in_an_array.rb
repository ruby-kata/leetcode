# @param {Integer[]} nums
# @return {Integer}
def count_complete_subarrays(nums)
    total = nums.uniq.size
    count = 0
    counter = Hash.new(0)

    i = j = 0
    while i < nums.size
        counter[nums[i]] += 1
        # j........i...n
        # [complete] ---> there're {n-i} complete sub-arrays
        while counter.size == total
            count += nums.size - i
            counter[nums[j]] -= 1
            counter.delete(nums[j]) if counter[nums[j]] == 0
            j += 1
        end
        i += 1
    end

    count
end
