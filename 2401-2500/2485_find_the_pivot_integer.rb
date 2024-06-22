# @param {Integer} n
# @return {Integer}
def pivot_integer(n)
    sum = (1..n).sum
    prefix_sum = 0
    (1..n).find do |i|
        sum - prefix_sum == prefix_sum += i
    end || -1
end
