# @param {Integer[]} nums
# @return {Integer}
def find_max_k(nums)
    max = -1
    appear = Hash.new
    nums.each do |num|
        if appear.has_key?(num)
            max = [max, num.abs].max
        end
        appear[-num] = true
    end

    max
end
