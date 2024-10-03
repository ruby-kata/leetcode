# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def min_subarray(nums, p)
    mod_all = nums.sum % p
    return 0 if mod_all == 0

    min = nums.size
    mod_to_last_index = {0 => -1}
    curr_mod = 0
    (0...nums.size).each { |i|
        curr_mod = (curr_mod + nums[i]) % p
        target_mod = (curr_mod - mod_all + p) % p
        if mod_to_last_index.has_key?(target_mod)
            min = [min, i - mod_to_last_index[target_mod]].min
        end
        mod_to_last_index[curr_mod] = i
    }

    min == nums.size ? -1 : min
end
