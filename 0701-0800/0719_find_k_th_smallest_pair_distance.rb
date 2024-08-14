# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_distance_pair(nums, k)
    nums.sort!

    # counting pairs which have distance <= dist
    count_pairs = lambda { |dist|
        count = 0
        (0...nums.size).each { |i|
            if j = nums.bsearch_index { |x| nums[i] - x <= dist }
                count += i - j
            end
        }

        count
    }

    # binary search to find the distance
    # that the number of pairs which have distance not larger than that distance, equals k
    # that mean the k-th smallest is that distance
    low = 0
    high = nums.last - nums.first
    while low < high
        mid = (low + high)/2
        count = count_pairs.call(mid)
        if count >= k
            high = mid
        else
            low = mid + 1
        end
    end

    low
end
