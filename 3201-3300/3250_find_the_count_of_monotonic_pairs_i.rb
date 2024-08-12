# @param {Integer[]} nums
# @return {Integer}
def count_of_pairs(nums)
    mod = 1000000007
    max = 50
    dp = Array.new(2) { Array.new(max+1, 0) }
    curr = 0
    (0..nums.first).each { |i| dp[curr][i] = 1 }

    (1...nums.size).each { |i|
        curr = 1 - curr
        k = 0
        sum = 0
        (0..nums[i]).each { |s|
            # arr1[i] = s => arr2[i] = nums[i] - s
            # arr1[i-1] = k => arr2[i-1] = nums[i-1] - k
            # arr2[i-1] has to >= arr2[i]
            while k <= s && nums[i-1] - k >= nums[i] - s
                sum = (sum + dp[1-curr][k]) % mod
                k += 1
            end

            dp[curr][s] = sum
        }

        (nums[i]+1..max).each { |i| dp[curr][i] = 0 }
    }

    count = 0
    dp[curr][0..nums[-1]].each { |c| count = (count + c) % mod }

    count
end
