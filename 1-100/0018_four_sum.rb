def four_sum(nums, target)
    nums.sort!

    quadruplets = []
    (0...nums.length-3).each do |i|
        next if i > 0 && nums[i] == nums[i-1]

        (i+1...nums.length-2).each do |j|
            next if j > i + 1 && nums[j] == nums[j-1]

            lo = j + 1; hi = nums.length-1
            while lo < hi
                sum = nums[i] + nums[j] + nums[lo] + nums[hi]
                if sum == target
                    quadruplets << [nums[i], nums[j], nums[lo], nums[hi]]
                    lo += 1; hi -= 1
                    hi -= 1 while lo < hi && nums[hi] == nums[hi+1]
                    lo += 1 while lo < hi && nums[lo] == nums[lo-1]
                elsif sum > target
                    hi -= 1
                else
                    lo += 1
                end
            end
        end
    end

    quadruplets
end
