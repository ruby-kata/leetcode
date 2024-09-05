# @param {Integer[][]} grid
# @return {Integer}
def projection_area(grid)
    grid.map { |rows| rows.size - rows.count(&:zero?) + rows.max }.sum + grid.transpose.map(&:max).sum
end
