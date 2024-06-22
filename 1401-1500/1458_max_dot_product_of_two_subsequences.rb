# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_dot_product(nums1, nums2)
    dp = Array.new(nums1.size) { Array.new(nums2.size) }
    dp[nums1.size-1][nums2.size-1] = nums1.last * nums2.last

    (nums1.size-2).downto(0) do |i| 
        dp[i][nums2.size-1] = [nums1[i] * nums2[nums2.size-1], dp[i+1][nums2.size-1]].max
    end

    (nums2.size-2).downto(0) do |j| 
        dp[nums1.size-1][j] = [nums2[j] * nums1[nums1.size-1], dp[nums1.size-1][j+1]].max
    end

    (nums1.size-2).downto(0) do |i|
        (nums2.size-2).downto(0) do |j|
            dp[i][j] = nums1[i] * nums2[j]  
            dp[i][j] += dp[i+1][j+1] if dp[i+1][j+1] > 0
            dp[i][j] = [dp[i][j], dp[i][j+1], dp[i+1][j]].max
        end
    end

    dp[0][0]
end
