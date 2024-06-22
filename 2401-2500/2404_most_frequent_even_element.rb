# @param {Integer[]} nums
# @return {Integer}
def most_frequent_even(nums)
    counter = Hash.new(0)
    nums.each do |num|
        counter[num] += 1 if num % 2 == 0
    end

    return -1 if counter.empty?

    counter.entries.sort { |x, y| x.last == y.last ? y.first - x.first : x.last - y.last }.last.first
end
