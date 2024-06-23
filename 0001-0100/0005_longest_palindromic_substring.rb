def longest_palindrome(s)
    str = "^|#{s.chars.join("|")}|$"
    dp = Array.new(str.length, 0)
    i = 1; l = 1; r = 1; max = 0; max_i = -1

    while i < str.length-1
        dp[i] = [0, [r-i, dp[l + r - i]].min].max
        while str[i - dp[i]] == str[i + dp[i]]
            dp[i] += 1
        end

        if max < dp[i]
            max = dp[i]
            max_i = i
        end

        if i + dp[i] > r
            r = i + dp[i]
            l = i - dp[i]
        end

        i += 1
    end

    s[((max_i - dp[max_i]) / 2)..((max_i - 1 + dp[max_i]) / 2 - 1)]
end

