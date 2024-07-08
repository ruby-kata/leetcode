# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_k_bit_flips(nums, k)
    flips_count = 0
    # the current flip state at i = flip_state_at_i-k ^ flip_state_at_i-k+1 ^ ....flip_state_at_i-1
    flipped = 0
    (0...nums.length).each do |i|
        flipped ^= (1-nums[i-k]) if i >= k
        # ....1|0............
        # .... i......i+k....
        # whatever the start window i
        # if the current state of nums[i] is 1, it must be flipped
        # and if the current state of nums[i] is 0, it must not be flipped 
        nums[i] = flipped == 0 ? nums[i] : 1 - nums[i]
        
        if i > nums.length - k
            return -1 if nums[i] == 0
        else
            if nums[i] == 0
                flipped ^= 1
                flips_count += 1
            end
        end
    end

    flips_count
end
