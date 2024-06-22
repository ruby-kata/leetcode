# @param {Integer[]} nums
# @return {Integer[]}
def largest_divisible_subset(nums)
    nums.sort!
    largest_subsets = Array.new(nums.size) { [] }

    (nums.size-1).downto(0) do |i|
        largest_subsets[i] << nums[i] if largest_subsets[i].empty?
        
        (i-1).downto(0) do |j|
            if nums[i] % nums[j] == 0 && largest_subsets[j].size <= largest_subsets[i].size 
                largest_subsets[j] = [nums[j], *largest_subsets[i]]
            end
        end
    end

    largest_subsets.max_by(&:size)
end
