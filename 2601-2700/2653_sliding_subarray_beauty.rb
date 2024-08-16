# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def get_subarray_beauty(nums, k, x)
    # sliding window
    # -50 <= nums[i] <= 50
    size = 50
    counter = Array.new(2*size+1, 0)
    # this leetcode problem is required very strict performamce in ruby
    # can not use (0..size).each <--- TIME LIMIT EXCEEDED, i guest because it created enumerator objects
    # using while-loop instead in order to gain a little bit performance to pass all cases
    beauty = lambda { 
        count = 0
        i = 0
        # calculate sum number of negative numbers from -50 to -1
        # when it reach x then the current negative num is the x-th smallest negative num.
        while i < size
            count += counter[i]
            break if count >= x

            i += 1
        end

        i - size
    }

    beauties = []
    i = 0
    while i < k 
        counter[nums[i] + size] += 1
        i += 1
    end

    beauties << beauty.call()
    
    while i < nums.size
        # maintain window size k
        counter[nums[i] + size] += 1
        counter[nums[i-k] + size] -= 1

        beauties << beauty.call()

        i += 1
    end

    beauties
end
