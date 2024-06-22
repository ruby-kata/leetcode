# @param {Integer[]} nums
# @param {Integer} min_k
# @param {Integer} max_k
# @return {Integer}
def count_subarrays(nums, min_k, max_k)
    count = 0
    counter = Hash.new(0)
    min = Float::INFINITY
    max = 0
    i = j = 0
    prev = 0

    while j < nums.size
        min = nums[j] if min > nums[j]
        max = nums[j] if max < nums[j]
        counter[nums[j]] += 1

        if min < min_k || max > max_k
            min = Float::INFINITY
            max = 0
            counter.clear
            prev = 0
            i = j + 1
        end

        while i <= j && ((nums[i] > min && nums[i] < max) || (counter[nums[i]] > 1 && (nums[i] == min || nums[i] == max)))
            counter[nums[i]] -= 1
            prev += 1
            i += 1
        end

        count += prev + 1 if min == min_k && max == max_k
        j += 1
    end

    count
end
