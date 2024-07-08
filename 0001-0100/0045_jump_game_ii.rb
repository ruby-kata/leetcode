# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
    count = 0
    max_index = 0
    next_jump_index = 0
    (0...nums.size-1).each do |i|
        max_index = [max_index, i + nums[i]].max
        if max_index >= nums.size-1
            count += 1
            break
        end

        if i == next_jump_index
            count += 1
            next_jump_index = max_index
        end
    end

    count
end
