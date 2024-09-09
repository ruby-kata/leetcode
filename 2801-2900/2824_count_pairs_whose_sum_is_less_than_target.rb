# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def count_pairs(nums, target)
    count = 0
    (0...nums.size).each { |i|
        (i+1...nums.size).each { |j|
            count += 1 if nums[i] + nums[j] < target 
        }
    }

    count
end

# sort + binary-search
def count_pairs(nums, target)
    # the condition i < j does not matter (but the condition i < j, a < b will matter)
    # assume that we have pair a, b that a + b < target, at _i, _j respectively,
    # in case of a before b, we have i = _i < j = _j
    # in case if a after b, we have i = _j < j = _i
    # so we always can count pair (a,b) (a + b < target) no matter what the order of a, b is
    # so we can sort the nums and take advantage of it
    nums.sort!
    nums << Float::INFINITY
    count = 0
    (0...nums.size).each { |i|
        j = nums.bsearch_index { |x| x >= target - nums[i] }
        count += [i-1, j-1].min + 1 if j
    }

    count
end
