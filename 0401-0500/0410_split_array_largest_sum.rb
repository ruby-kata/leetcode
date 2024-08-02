# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def split_array(nums, k)
    # count number of sub-array that has sum <= largest-sum
    count_sub_arrs = lambda { |largest_sum|
        count = 0
        sum = 0
        nums.each { |num|
            if sum + num <= largest_sum
                sum += num
            else
                count += 1
                sum = num
            end
        }

        count
    }

    # the smaller the largest-sum is, the more sub-arrays we can divide
    # so we need to find the max largest-sum that we can divide nums into more than or equal k sub-arrays
    # that is also the min largest-sum we can divide nums into k sub-arrays

    low = nums.max
    high = nums.sum + 1

    while low < high
        mid = (low + high)/2
        count = count_sub_arrs.call(mid)

        if count >= k # still be able to divide nums more than k sub-arrays
            low = mid + 1
        else
            high = mid
        end
    end

    low
end
