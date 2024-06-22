# @param {Integer} n
# @return {Integer}
def count_orders(n)
    mod = 1000000007
    counter = Array.new(n+1) { Array.new(n+1, 0) }
    counter[0][0] = 1
    (1..n).each do |i|
        counter[0][i] = i * counter[0][i-1]
    end

    (1..n).each do |p|
        (p..n).each do |d|
            counter[p][d] += p * counter[p-1][d]
            counter[p][d] += (d-p) * counter[p][d-1]
            counter[p][d] %= mod
        end
    end

    counter[n][n]
end
