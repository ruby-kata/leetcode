# @param {String} s
# @param {Integer} k
# @return {Boolean}
def can_construct(s, k)
    return false if s.size < k

    odd_count = s.chars.tally.values.map { |v| v % 2 }.sum
    odd_count <= k
end
