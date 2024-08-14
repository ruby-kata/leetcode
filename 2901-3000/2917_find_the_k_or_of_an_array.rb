# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_k_or(nums, k)
    bit_set_counter = Array.new(31, 0)
    nums.each { |num|
        i = 0
        while num > 0
            bit_set_counter[i] += (num & 1)
            i += 1
            num >>= 1
        end
    }

    bit_set_counter
        .map { |c| c >= k ? 1 : 0 }
        .reverse
        .join.to_s
        .to_i(2)
end

def find_k_or(nums, k)
    k_or = 0
    (0..31).each { |i|
        count = nums.count { |num| ((num >> i) & 1) == 1 }
        k_or |= (1 << i) if count >= k
    }

    k_or
end
