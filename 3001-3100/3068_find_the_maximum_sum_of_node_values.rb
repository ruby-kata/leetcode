# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer[][]} edges
# @return {Integer}
def maximum_value_sum(nums, k, edges)
    # we could ignore the edges, since we could pick any pair of nodes without worry about the connected edges:
    # a -> b -> c -> d
    # a^k b^k b^k c^k c^k d^k
    # a^k b       c       d^k
    # so we could pick a & d without worry about b and c
    #
    # -> greedy: xor all nums that num^k > num
    # if number of xor is odd that mean there's a num need to reverted back, 
    # so we pick the smallest of diff to be reverted:
    # a -> b -> c -> d -> e
    # a^k  b  c^k c^k    e^k
    # so we could see that the c node is reverted
    # But: if |b^k-b| or |d^k-d| < |c^k -c|, we could xor up the c node one more time, since:
    # a^k b^k  c^k d e^k > a^k b c d e^k
    #

    sum = 0
    count_xor = 0
    min_diff = Float::INFINITY
    nums.each do |num|
        diff = (num^k) - num
        if diff > 0
            sum += num^k
            count_xor += 1
        else
            sum += num
        end
        min_diff = [min_diff, diff.abs].min
    end

    count_xor.odd? ? (sum - min_diff) : sum
end
