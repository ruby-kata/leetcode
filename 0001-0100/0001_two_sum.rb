def two_sum(nums, target)
    ans = []
    prev = Hash.new
    nums.each_with_index do |num, i|
        complement = target - num
        if prev.has_key?(complement)
            ans = [prev[complement], i]
            break
        end
        prev[num] = i
    end
    ans
end
