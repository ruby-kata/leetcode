# @param {Integer[]} nums
# @param {Integer[]} queries
# @param {Integer} x
# @return {Integer[]}
def occurrences_of_element(nums, queries, x)
    x_indexes = [] 
    nums.each.with_index { |num, i|
        x_indexes << i if num == x
    }

    queries.map { |q| x_indexes[q-1] || -1 }
end
