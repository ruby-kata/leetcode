# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    counter = Hash.new(0)
    nums.each do |num|
        counter[num] += 1
    end

    counter.sort_by(&:last).last(k).map(&:first)
end
