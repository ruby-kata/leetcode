# @param {String} s
# @return {Integer}
def min_cut(s)
    palindromes = Array.new(s.size) { Array.new(s.size, true) }
    (2..s.size).each do |len|
        i, j = 0, len-1
        while j < s.size
            palindromes[i][j] = s[i] == s[j] && palindromes[i+1][j-1]
            i += 1
            j += 1
        end
    end
    
    return 0 if palindromes[0][s.size-1]

    dp = Array.new(s.size+1, Float::INFINITY)
    dp[s.size] = -1
    (s.size-1).downto(0) do |i|
        (s.size-1).downto(i) do |j|
            if palindromes[i][j] && dp[i] > 1 + dp[j+1]
                dp[i] = 1 + dp[j+1]
            end

            break if dp[i] <= 1
        end
    end

    dp[0]
end
