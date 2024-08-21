# @param {String} s
# @return {Integer}
def strange_printer(s)
    dp = Array.new(s.length) { Array.new(s.length, Float::INFINITY) }

    (s.length-1).downto(0) { |i|
        dp[i][i] = 1
        (i+1...s.length).each { |j|
            # assume s[i..j] like a...a
            # we always need to print the first character 'a',
            # the optimize way is we print all 'a' from i to j,
            # hence the last character is also printed if they are the same
            if s[j] == s[i]
                dp[i][j] = dp[i][j-1]
            else
                (i+1..j).each { |k|
                    dp[i][j] = [dp[i][j], dp[i][k-1] + dp[k][j]].min
                }
            end
        }
    }

    dp[0][s.length-1]
end
