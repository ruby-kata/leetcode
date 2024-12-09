# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Boolean[]}
def is_array_special(nums, queries)
    parity = lambda { |num| (num & 1) }
    bs = lambda { |arr, qi, qj|
        low = 0
        high = arr.size
        while low < high
            m = (low + high) / 2
            if arr[m][1] <= qi
                low = m + 1
            elsif arr[m][0] >= qj
                high = m
            else
                return false
            end
        end

        true
    }

    is_same_parity = []
    i = j = 0
    while i < nums.size
        curr_parity = parity.call(nums[i])
        j += 1 while j < nums.size && parity.call(nums[j]) == curr_parity
        is_same_parity << [i, j-1] if j-1 > i
        i = j
    end

    queries.map { |qi, qj|
        next true if qi == qj
        bs.call(is_same_parity, qi, qj)
    }
end
