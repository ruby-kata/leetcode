# @param {Integer[][]} grid
# @return {Integer}
def minimum_moves(grid)
    empties = []
    multies = []
    (0...3).each do |r|
        (0...3).each do |c|
            empties << [r, c] if grid[r][c] == 0
            if grid[r][c] > 1
                (grid[r][c]-1).times do
                    multies << [r, c]
                end
            end
        end    
    end

    move = ->(i, state) {
        return 0 if i == multies.size

        min_moves = Float::INFINITY
        (0...empties.size).each do |j|
            if (state & (1 << j)) == 0
                min_moves_from_here = (empties[j][0] - multies[i][0]).abs + (empties[j][1] - multies[i][1]).abs + move.call(i+1, state | (1 << j))
                min_moves = min_moves_from_here if min_moves_from_here < min_moves
            end
        end

        min_moves
    }

    move.call(0, 0)
end


# def get_distance(empty, extra)
#     x_dist = (empty[0] - extra[0]).abs
#     y_dist = (empty[1] - extra[1]).abs
#     x_dist + y_dist
# end

# def minimum_moves(grid)
#     rows = grid.length
#     cols = grid[0].length
#     extra_stones = []
#     empty_squares = []

#     (0...rows).each do |i|
#         (0...cols).each do |j|
#             if grid[i][j] == 0
#                 empty_squares << [i, j]
#             elsif grid[i][j] > 1
#                 (grid[i][j] - 1).times do
#                     extra_stones << [i, j]
#                 end
#             end
#         end
#     end

#     return -1 if empty_squares.length > extra_stones.length

#     perms = extra_stones.permutation(extra_stones.length).to_a
#     min = Float::INFINITY

#     perms.each do |perm|
#         tot_dist = 0
#         perm.each_with_index do |extra, index|
#             empty = empty_squares[index]
#             tot_dist += get_distance(empty, extra)
#         end
#         min = [min, tot_dist].min
#     end

#     min
# end
