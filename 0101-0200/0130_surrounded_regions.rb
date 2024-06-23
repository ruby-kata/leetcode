# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
    def dfs(i, j, board)
        return if i < 0 || j < 0 || i >= board.size || j >= board[0].size
        return if board[i][j] != "O"

        board[i][j] = "*"
        dfs(i + 1, j, board)
        dfs(i - 1, j, board)
        dfs(i, j + 1, board)
        dfs(i, j - 1, board)
    end

    (0...board.size).each do |r|
        dfs(r, 0, board)
        dfs(r, board[0].size-1, board)
    end

    (0...board[0].size).each do |c|
        dfs(0, c, board)
        dfs(board.size-1, c, board)
    end

    (0...board.size).each do |r|
        (0...board[0].size).each do |c|
            if board[r][c] == "*"
                board[r][c] = "O"
            elsif board[r][c] == "O"
                board[r][c] = "X"
            end
        end
    end
end
