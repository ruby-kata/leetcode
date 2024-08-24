# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
    dp = Array.new(m+1) { Array.new(n+1, 0) }
    strs.each { |str|
        counter = str.chars.tally
        zeros = counter['0'] || 0
        ones = counter['1'] || 0
        (m).downto(zeros) { |i|
            (n).downto(ones) { |j|
                dp[i][j] = [dp[i][j], dp[i - zeros][j- ones] + 1].max
            }
        }
    }

    dp[m][n]
end
