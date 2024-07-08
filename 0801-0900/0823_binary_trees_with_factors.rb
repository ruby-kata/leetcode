# @param {Integer[]} arr
# @return {Integer}
def num_factored_binary_trees(arr)
    mod = 1000000007
    arr.sort!

    sum = 0
    dp = Hash.new
    (0...arr.size).each do |i|
        dp[arr[i]] = 1
        (0...i).each do |j|
            if arr[i] % arr[j] == 0 && dp.has_key?(d = arr[i] / arr[j])
                dp[arr[i]] += dp[arr[j]] * dp[d]
                dp[arr[i]] %= mod
            end
        end
        
        sum += dp[arr[i]]
        sum %= mod
    end

    sum
end
