# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def get_common(nums1, nums2)
    p2 = 0
    while p2 < nums2.size
        return nums2[p2] if nums1.bsearch { |x| nums2[p2] <=> x }

        loop do
            p2 += 1
            break if nums2[p2] != nums2[p2-1]
        end
    end

    -1
end
