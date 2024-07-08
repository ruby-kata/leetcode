# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    curr = nil
    curr_count = 0
    nums.each do |num|
        if curr_count == 0 || curr == num
            curr = num
            curr_count += 1
        else
            curr_count -= 1
        end
    end

    curr
end
