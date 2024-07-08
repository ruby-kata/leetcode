def min_distance(word1, word2)
    dp = Array.new(word1.length + 1) { Array.new(word2.length + 1, Float::INFINITY) }

    (word1.length).downto(0) do |i|
        dp[i][word2.length] = word1.length - i
    end

    (word2.length).downto(0) do |j|
        dp[word1.length][j] = word2.length - j
    end
    
    (word1.length-1).downto(0) do |i|
        (word2.length-1).downto(0) do |j|
            min = if word1[i] == word2[j] then
                dp[i+1][j+1]
            else
                1 + [dp[i+1][j+1], dp[i][j+1], dp[i+1][j]].min
            end
            dp[i][j] = min if dp[i][j] > min
        end
    end

    dp[0][0]
end
