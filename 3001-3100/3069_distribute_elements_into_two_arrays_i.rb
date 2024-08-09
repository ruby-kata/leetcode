# @param {Integer[]} nums
# @return {Integer[]}
def result_array(nums)
    a1 = [nums[0]]
    a2 = [nums[1]]
    (2...nums.size).each { |i|
        if a1.last > a2.last
            a1 << nums[i]
        else
            a2 << nums[i] 
        end
    }

    a1 + a2
end

# swap in place
# space O(1)
def result_array(nums)
    i = 0
    j = 1
    (2...nums.size).each { |k|
        if nums[i] > nums[j]
            i += 1
            until k == i
                nums[k] = nums[k-1] ^ nums[k]
                nums[k-1] = nums[k] ^ nums[k-1]
                nums[k] = nums[k-1] ^ nums[k]  
                k -= 1
            end
        end
        j += 1
    }

    nums
end
