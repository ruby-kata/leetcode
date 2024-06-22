# @param {Integer} n
# @return {Integer}
def num_squares(n)
    dp = Array.new(n+1, Float::INFINITY)
    dp[0] = 0

    (1..n).each do |i|
        x = 1
        while x <= i
            x_square = x * x
            break if x_square > i
            
            dp[i] = [dp[i], 1 + dp[i - x_square]].min
            x += 1
        end
    end

    dp[n]
end
