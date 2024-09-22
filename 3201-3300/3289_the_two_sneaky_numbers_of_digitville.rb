# @param {Integer[]} nums
# @return {Integer[]}
def get_sneaky_numbers(nums)
    nums.tally.select { |k, v| v == 2 }.keys
end
