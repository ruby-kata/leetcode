# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
    size = 1 << nums.length
    subsets = Array.new(size) { [] }
    (0...size).each do |sub|
        (0...nums.length).each do |i|
            subsets[sub].push(nums[i]) if ((sub >> i) & 1) == 1
        end
    end

    subsets
end
