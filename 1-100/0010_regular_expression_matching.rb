# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    dp = Array.new(s.size + 1) { Array.new(p.size + 1) { false } }
    dp[0][0] = true

    (0...p.size).each { |i|
        dp[0][i+1] = dp[0][i-1] if p[i] == "*"
    }

    (0...s.size).each { |j|
        (0...p.size).each { |i|
            if p[i] == "*"
                dp[j+1][i+1] = dp[j+1][i-1] || ((p[i-1] == "." || p[i-1] == s[j]) && dp[j][i+1])
            else
                dp[j+1][i+1] = (p[i] == "." || p[i] == s[j]) && dp[j][i]
            end
        }
    }

    dp[s.size][p.size]
end
