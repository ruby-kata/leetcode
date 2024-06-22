# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    min_opt = 0
    nums.tally.each do |num, count|
        if count == 1
            return -1
        else
            min_opt += (count + 2) / 3
        end
    end

    min_opt
end
