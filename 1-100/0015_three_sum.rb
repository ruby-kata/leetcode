def three_sum(nums)
    return [] if (nums.length < 3)

    nums.sort!

    solutions = []
    nums.each_with_index do |num, i|
        break if nums[i] > 0
        next if i > 0 && nums[i] === nums[i-1]

        l = i + 1; r = nums.length-1
        while l < r
            sum = nums[i] + nums[l] + nums[r]
            if sum == 0
                solutions << [nums[i], nums[l], nums[r]]
                l += 1; r -= 1
                l += 1 while l < r && nums[l] == nums[l-1]
                r -= 1 while l < r && nums[r] == nums[r+1]
            elsif sum < 0
                l += 1
            else
                r -= 1
            end
        end
    end

    solutions
end
