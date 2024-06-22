# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def max_sum_after_partitioning(arr, k)
    dp = Array.new(arr.size+1, 0)
    (arr.size-1).downto(0).each do |i|
        max = 0
        (i...[i+k, arr.size].min).each do |j|
            max = [max, arr[j]].max
            dp[i] = [dp[i], max*(j-i+1) + dp[j+1]].max
        end
    end

    dp[0]
end
