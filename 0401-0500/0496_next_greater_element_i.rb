# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
    next_ges = {}
    mono_stack = []
    nums2.each_with_index do |num, j|
        until mono_stack.empty? || mono_stack.last >= num
            next_ges[mono_stack.pop] = num
        end
        mono_stack << num
        next_ges[num] = -1
    end

    nums1.map do |num|
        next_ges[num]
    end
end
