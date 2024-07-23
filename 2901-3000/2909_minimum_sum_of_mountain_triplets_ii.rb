# @param {Integer[]} nums
# @return {Integer}
def minimum_sum(nums)
    prefix_min = Array.new(nums.length)
    suffix_min = Array.new(nums.length)
    
    prefix_min[0] = nums.first
    (1...nums.length).each { |i|
        prefix_min[i] = [prefix_min[i-1], nums[i]].min
    }

    suffix_min[-1] = nums.last
    (nums.length-2).downto(0) { |k|
        suffix_min[k] = [suffix_min[k+1], nums[k]].min
    }

    min = Float::INFINITY
    (1...nums.length-1).each { |j|
        if nums[j] > prefix_min[j-1] && nums[j] > suffix_min[j+1] 
            min = [min, (prefix_min[j-1] + nums[j] + suffix_min[j+1])].min
        end
    }

    min == Float::INFINITY ? -1 : min
end
