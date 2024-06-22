# @param {Integer} n
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def num_of_arrays(n, m, k)
    mod = 1_000_000_007
    ways_count = Array.new(n+1) { Array.new(m+1) { Array.new(k+1).fill(0) } }
    prefix_sum = Array.new(n+1) { Array.new(m+1) { Array.new(k+1).fill(0) } }

    (1..m).each do |max|
        ways_count[1][max][1] = 1
        prefix_sum[1][max][1] = max
    end

    (2..n).each do |len|
        (1..m).each do |max|
            (1..k).each do |cost|
                ways_count[len][max][cost] = (max * ways_count[len-1][max][cost] + prefix_sum[len-1][max-1][cost-1]) % mod
                prefix_sum[len][max][cost] = (ways_count[len][max][cost] + prefix_sum[len][max-1][cost]) % mod
            end
        end
    end

    prefix_sum[n][m][k]
end
