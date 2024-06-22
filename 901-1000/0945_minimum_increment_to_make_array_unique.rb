# @param {Integer[]} nums
# @return {Integer}
def min_increment_for_unique(nums)
    count = 0
    move = 0
    counter = nums.tally
    counter.keys.sort.each do |i|
        move = i if move < i
        count += (move - i) * counter[i] + ((counter[i] * (counter[i] - 1))/2)
        move += counter[i]
    end

    count
end
