# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
    counter = Array.new(target+1, 0)
    counter[0] = 1

    (1..target).each do |i|
        nums.each do |num|
            next if i < num
            counter[i] += counter[i-num]
        end
    end

    counter[target]
end
