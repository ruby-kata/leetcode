# @param {Integer[]} candy_type
# @return {Integer}
def distribute_candies(candy_type)
    [candy_type.size/2, candy_type.tally.size].min
end
