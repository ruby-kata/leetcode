# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    dp = Array.new(s.size + 1) { Array.new(p.size + 1) { false } }
    dp[s.size][p.size] = true
    (p.size-1).downto(0).each do |j|
         dp[s.size][j] = dp[s.size][j+1] if p[j] == "*"
    end 
 
    (s.size-1).downto(0).each do |i|
         (p.size-1).downto(0).each do |j|
             if p[j] == "*"
                 dp[i][j] = dp[i+1][j] || dp[i][j+1]
             elsif p[j] == "?" or p[j] == s[i]
                 dp[i][j] = dp[i+1][j+1]
             end
         end
    end
 
    dp[0][0]
 end
 