# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def minimum_sum(n, k)
    # greedy
    # [+1...+k/2] -k/2+1..-k-1 [+k..]
    x = [k/2, n].min
    (1..x).sum + (k...k+(n-x)).sum
end
