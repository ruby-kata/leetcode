# @param {Integer[]} nums
# @return {Integer}
def minimum_average_difference(nums)
    prefix_sums = [nums.first]
    (1...nums.length).each { |i|
        prefix_sums << (prefix_sums[-1] + nums[i])
    }

    min_index = prefix_sums.length 
    min_ave_diff = Float::INFINITY
    (0...prefix_sums.length).map { |i|
        l = prefix_sums[i]/(i+1)
        r = prefix_sums.length-i-1 > 0 ? (prefix_sums[-1] - prefix_sums[i])/(prefix_sums.length-i-1) : 0
        ave_diff = (l - r).abs
        if min_ave_diff > ave_diff
            min_index = i
            min_ave_diff = ave_diff
        end
    }

    min_index
end
