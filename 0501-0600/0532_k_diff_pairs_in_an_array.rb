# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_pairs(nums, k)
    count = 0
    appear = Hash.new(0)

    nums.each { |num|
        next if appear[num] >= (k == 0 ? 2 : 1)

        if k == 0
            count += appear[num] == 1 ? 1 : 0
        else
            count += (appear[num-k] >= 1 ? 1 : 0) + (appear[num+k] >= 1 ? 1 : 0)
        end
        appear[num] += 1
    }

    count
end
