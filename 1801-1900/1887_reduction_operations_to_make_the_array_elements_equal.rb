# @param {Integer[]} nums
# @return {Integer}
def reduction_operations(nums)
    nums.sort!

    step = 0
    count = 0
    nums.each_cons(2) do |prev_num, num|
        if prev_num < num
            step += 1
        end

        count += step
    end

    count
end
