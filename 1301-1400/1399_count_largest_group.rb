# @param {Integer} n
# @return {Integer}
def count_largest_group(n)
    counter = (1..n).map { |num| num.digits.sum }.tally.values
    counter.count(counter.max)
end
