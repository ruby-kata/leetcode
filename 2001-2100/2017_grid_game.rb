# @param {Integer[][]} grid
# @return {Integer}
def grid_game(grid)
    first_line_sum = grid[0].sum
    second_line_sum = grid[1].sum
    min_second_robot_can_collect = Float::INFINITY

    first_line_collected = 0
    second_line_ignored = 0
    (0...grid[0].size).each { |i|
        first_line_collected += grid[0][i]

        # The key is not to maximize the points collected by the first robot 
        # but to find a path for the first robot that minimizes the points the second robot can collect.
        min_second_robot_can_collect = [
            min_second_robot_can_collect,
            # max points the second robot can get 
            [first_line_sum - first_line_collected, second_line_ignored].max
        ].min

        second_line_ignored += grid[1][i]
    }

    min_second_robot_can_collect
end
