# @param {Integer[]} nums
# @return {Integer[]}
def find_prefix_score(nums)
    sum = 0
    curr_max = 0
    nums.map { |num|
        curr_max = [curr_max, num].max
        sum += curr_max + num
    }
end
