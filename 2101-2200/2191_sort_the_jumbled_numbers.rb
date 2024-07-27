# @param {Integer[]} mapping
# @param {Integer[]} nums
# @return {Integer[]}
def sort_jumbled(mapping, nums)
    mapped = mapping.map.with_index { |m, i| [i, m] }.to_h
    
    nums.map { |num|
        [num, num.digits.reverse.map { |d| mapped[d] }.join.to_i]
    }
    .sort_by(&:last)
    .map(&:first)
end
