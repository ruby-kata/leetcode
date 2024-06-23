def three_sum_closest(nums, target)
    nums.sort!
    
    closest_sum = 0; closest_dis = Float::INFINITY
    for start in (0..nums.length - 3)
        next if start > 0 && nums[start] == nums[start - 1]
        
        low = start + 1; high = nums.length - 1
        while low < high
            sum = nums[start] + nums[low] + nums[high]
            return sum if sum == target

            if (new_dis = (sum - target).abs) < closest_dis
                closest_sum = sum
                closest_dis = new_dis
            end

            if sum > target
                high -= 1
            else
                low += 1
            end
        end
    end

    closest_sum
end
