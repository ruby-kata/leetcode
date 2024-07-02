# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_or(nums, k)
    prefix_or = [0]
    (1...nums.length).each { |i|
        prefix_or.push(prefix_or[-1] | nums[i-1])
    }

    suffix_or = [0]
    (nums.length-2).downto(0).each { |j|
        suffix_or.unshift(suffix_or[0] | nums[j+1])
    }

    # the farther the left-most-significant-bit is, the larger the sum-or
    # ...101010.......100...1010...
    #    ^
    # so for each num (each case): 
    # the greedy shift left k bits at that num will make sure we will get the farthest left-most-significant-bit in that case,
    # since any shift left on any other nums will slow down the current left-most-significant-bit on moving to the left,
    # finally the max of all cases will be the answer
    (0...nums.length).map { |i|
        prefix_or[i] | (nums[i] << k) | suffix_or[i]
    }.max
end
