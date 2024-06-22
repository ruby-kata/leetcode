# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[][]}
def divide_array(nums, k)
    nums.sort!
    ans = []
    nums.each_slice(3) do |arr|
        return [] if arr[2] - arr[0] > k
        ans << arr
    end

    ans
end
