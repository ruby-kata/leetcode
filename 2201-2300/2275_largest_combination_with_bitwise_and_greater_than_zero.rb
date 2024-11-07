# @param {Integer[]} candidates
# @return {Integer}
# time complexity: O(24n)
# space complexity: O(1)
def largest_combination(candidates)
    # For the bitwise AND to be greater than zero, at least one bit should be 1 for every number in the combination.
    # So for every bit position, we can calculate the size of the largest combination 
    # such that the bitwise AND will have a 1 at that bit position.

    # candidates[i] <= 10**7, so the candidates are 24 bits long
    counter = Array.new(24, 0)

    candidates.each { |num|
        (0...24).each { |i|
            counter[i] += ((num >> i) & 1)
        }
    }
    counter.max
end
