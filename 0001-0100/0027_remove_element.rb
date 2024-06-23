# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
    k = 0
    nums.each do |num|
        if num != val
            nums[k] = num
            k += 1
        end
    end
    
    k
end


# another way
def remove_element(nums, val)
    len = 0
    nums.filter! { |num| keep = num != val; len += 1 if keep; keep; }
    len
end
