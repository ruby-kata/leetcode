# @param {Integer[][]} grid
# @return {Integer[]}
def find_missing_and_repeated_values(grid)
    repeat = nil
    sum = 0
    appeared = {}
    grid.each { |row|
        row.each { |x|
            repeat = x if appeared.has_key?(x)
            appeared[x] = true
            sum += x
        }
    }

    n = grid.length**2
    [repeat, (n+1)*n/2 - (sum - repeat)]
end
