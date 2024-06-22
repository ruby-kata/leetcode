# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def number_of_subarrays(nums, k)
    count = 0
    odd_indexes = []
    prev_odd_index = 0
    nums.each_with_index do |num, i|
        odd_indexes << (i + 1) if num.odd?
        prev_odd_index = odd_indexes.shift if odd_indexes.length > k
        count += (odd_indexes.first - prev_odd_index) if odd_indexes.length == k
    end

    count
end
