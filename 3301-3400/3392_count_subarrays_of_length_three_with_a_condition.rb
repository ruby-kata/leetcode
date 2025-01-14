# @param {Integer[]} nums
# @return {Integer}
def count_subarrays(nums)
    nums.each_cons(3).count { |l,m,r|
        2 * (l + r) == m
    }
end
