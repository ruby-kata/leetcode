# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    counter1 = nums1.tally
    nums2.select { |num|
        counter1.has_key?(num) && (counter1[num] -= 1) >= 0
    }
end
