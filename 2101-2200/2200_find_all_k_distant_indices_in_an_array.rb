# @param {Integer[]} nums
# @param {Integer} key
# @param {Integer} k
# @return {Integer[]}
def find_k_distant_indices(nums, key, k)
    (0...nums.size)
        .select { |i| 
            nums[i] == key 
        }
        .collect_concat { |i|
            ([i-k,0].max..[i+k,nums.size-1].min).to_a
        }
        .uniq
end
