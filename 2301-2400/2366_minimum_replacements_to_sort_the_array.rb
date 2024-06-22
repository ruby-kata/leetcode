def minimum_replacement(nums)
    count = 0
    curr_max = nums[nums.size-1]
    (nums.size-2).downto(0).each do |i|
        next if nums[i] == curr_max
        if nums[i] > curr_max
            if curr_max == 1
                count += nums[i] - 1
            else
                split = (nums[i].to_f/curr_max).ceil
                count += split-1
                curr_max = nums[i]/split
            end
        else
            curr_max = nums[i]
        end
    end

    count
end
