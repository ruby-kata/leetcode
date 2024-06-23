# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
    nums1 & nums2
end


def intersection(nums1, nums2)
    counter = nums1.tally
    result = []
    nums2.each do |num|
        break if counter.empty?
        if counter.has_key?(num)
            counter.delete(num)
            result << num
        end
    end

    result
end
