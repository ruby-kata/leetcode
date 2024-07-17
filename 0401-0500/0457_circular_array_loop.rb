# @param {Integer[]} nums
# @return {Boolean}
def circular_array_loop(nums)
    sign = lambda { |num| num > 0 ? 1 : -1 }
    next_index = lambda { |i| i >= 0 ? (i % nums.size) : ((nums.size - (-i % nums.size)) % nums.size) }

    (0...nums.size).any? do |i|
        sign_i = sign.call(nums[i])
        slow = i
        fast = i
        loop do
            slow = next_index.call(slow + nums[slow])
            break false if sign.call(nums[slow]) != sign_i

            break false unless 2.times do
                _fast = next_index.call(fast + nums[fast])
                break false if _fast == fast

                fast = _fast
                break false if sign.call(nums[fast]) != sign_i
            end

            break true if fast == slow
        end
    end
end
