# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
    rows = Array.new(9, 0)
    cols = Array.new(9, 0)
    boxes = Array.new(9, 0)

    board.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            next unless (d = cell.to_i) > 0
            mark = 1 << d

            return false unless (rows[i] & mark) == 0
            rows[i] |= mark
            
            return false unless (cols[j] & mark) == 0
            cols[j] |= mark

            box_index = (i/3).floor * 3 + (j/3).ceil
            return false unless (boxes[box_index] & mark) == 0
            boxes[box_index] |= mark
        end
    end

    true
end
