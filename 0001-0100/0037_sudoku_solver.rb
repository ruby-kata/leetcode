# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
    nums = (1..9)
    backtrack = ->(i, j, r, c, s) {
        return true if i == 9
        nextj = (j + 1) % 9
        nexti = i + (nextj.zero? ? 1 : 0)
        return backtrack.call(nexti, nextj, r, c, s) if board[i][j] != "."
        
        nums.each do |num|
            bit = 1 << (num-1)
            next if ((r[i] & bit) != 0) or ((c[j] & bit) != 0) or ((s[k = (i/3)*3 + j/3] & bit) != 0)

            old = board[i][j]
            r[i] |= bit
            c[j] |= bit
            s[k] |= bit
            board[i][j] = num.to_s

            return true if i == 8 and j == 8

            result = backtrack.call(nexti, nextj, r, c, s)
            return true if result == true


            r[i] &= ~bit
            c[j] &= ~bit
            s[k] &= ~bit
            board[i][j] = old
        end
        false
    }

    rows = Array.new(board.size) { 0 }
    cols = Array.new(board.size) { 0 }
    squares = Array.new(board.size) { 0 }
    (0...9).each do |i|
        (0...9).each do |j|
            if board[i][j] != "."
                index = 1 << (board[i][j].to_i - 1)
                rows[i] |= index
                cols[j] |= index
                squares[(i/3)*3 + j/3] |= index
            end
        end
    end

    backtrack.call(0, 0, rows, cols, squares)
end
