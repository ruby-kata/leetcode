# @param {String} s
# @return {Integer}
def count_substrings(s)
    dp = Array.new(s.size) { Array.new(s.size, false) }
    (0...s.size).each do |i|
        dp[i][i] = true
    end

    count = s.size
    (1...s.size).each do |len|
        (0...s.size-len).each do |i|
            dp[i][i+len] = s[i] == s[i+len] && (len > 1 ? dp[i+1][i+len-1] : true)
            count += 1 if dp[i][i+len]
        end
    end

    count
end
