# @param {Integer[][]} pairs
# @return {Integer}
def find_longest_chain(pairs)
    pairs.sort_by!(&:last)
    dp = Array.new(pairs.size, 1)

    longest = 0
    (pairs.size-1).downto(0).each do |i|
        (i..pairs.size-1).each do |j|
            if pairs[j][0] > pairs[i][1]
                dp[i] = dp[j] + 1
                break
            end
        end
        longest = dp[i] if dp[i] > longest
    end 

    longest
end
