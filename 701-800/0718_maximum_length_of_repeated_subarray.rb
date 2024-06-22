# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def find_length(nums1, nums2)
    dp = Array.new(2) { Array.new(nums2.size + 1, 0) }
    max = 0
    curr = 0
    (nums1.size-1).downto(0).each do |i|
        curr = 1 - curr
        (0...nums2.size).each do |j|
            dp[curr][j] = nums1[i] == nums2[j] ? 1 + dp[1-curr][j+1] : 0
            max = dp[curr][j] if dp[curr][j] > max
        end
    end

    max
end
