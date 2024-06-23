# @param {Integer} n
# @return {Integer}
def knight_dialer(n)
    mod = 1000000007
    moves = {
        0 => [4,6],
        1 => [6,8],
        2 => [7,9],
        3 => [4,8],
        4 => [0,3,9],
        5 => [],
        6 => [0,1,7],
        7 => [6,2],
        8 => [1,3],
        9 => [4,2]
    }

    counters = Array.new(10) { Array.new(n, 0) }
    (0..9).each do |i| 
        counters[i][0] = 1
    end

    (1...n).each do |i|
        (0..9).each do |j|
            moves[j].each do |k|
                counters[j][i] = (counters[j][i] + counters[k][i-1]) % mod
            end
        end
    end

    (0..9).reduce(0) { |acc, i| (acc + counters[i][n-1]) % mod }
end
