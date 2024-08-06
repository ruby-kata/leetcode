# @param {Integer[]} nums
# @return {Integer}
def continuous_subarrays(nums)
    count = 0
    i = j = 0
    max = min = nums[i]
    window = [nums[i]]

    loop do
        while i < j && max - min > 2
            x = window.shift
            max = window.max if max == x
            min = window.min if min == x

            i += 1
        end
        count += j-i+1
        
        j += 1
        break if j >= nums.size

        window.push(nums[j])
        max = nums[j] if max < nums[j]
        min = nums[j] if min > nums[j]
    end

    count
end
