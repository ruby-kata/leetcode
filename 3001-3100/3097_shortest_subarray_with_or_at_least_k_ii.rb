# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_subarray_length(nums, k)
    bit_set_counter = Array.new(32, 0)
    sliding_window_or = 0
    window_len = Float::INFINITY
    i = j = 0
    while i < nums.size
        # count bit-sets
        x = nums[i]
        shift_index = 0
        while x > 0
            bit_set_counter[shift_index] += 1 if (x & 1) == 1
            x >>= 1
            shift_index += 1
        end

        sliding_window_or |= nums[i]

        while sliding_window_or >= k && j <= i
            window_len = [window_len, i - j + 1].min
            return 1 if window_len == 1
            
            # remove bit-sets of the left-most number of the sliding window
            # if there's no bit-set at a position, the sliding_window_or result in 0, then remove it
            x = nums[j]
            shift_index = 0
            while x > 0
                bit_set_counter[shift_index] -= 1 if (x & 1) == 1
                x >>= 1
                if bit_set_counter[shift_index] <= 0 && ((sliding_window_or >> shift_index) & 1) == 1
                    sliding_window_or ^= (1 << shift_index)
                end
                shift_index += 1
            end

            j += 1
        end
        
        i += 1
    end

    window_len == Float::INFINITY ? -1 : window_len
end
