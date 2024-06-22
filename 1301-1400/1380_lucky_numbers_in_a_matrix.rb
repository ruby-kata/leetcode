# @param {Integer[][]} matrix
# @return {Integer[]}
def lucky_numbers (matrix)
    row_size = matrix.size
    col_size = matrix[0].size
    min_rows = Array.new(row_size, 0)
    max_cols = Array.new(col_size, 0)

    matrix.each_with_index do |row, row_index|
        row.each_with_index do |num, col_index|
            min_rows[row_index] = col_index if matrix[row_index][min_rows[row_index]] > num
            max_cols[col_index] = row_index if matrix[max_cols[col_index]][col_index] < num
        end
    end

    lucky_nums = []
    min_rows.each_with_index do |col_index, row_index|
        lucky_nums << matrix[row_index][col_index] if max_cols[col_index] == row_index
    end

    lucky_nums
end

# better
def lucky_numbers (input)
    input.transpose.map { |col| col.max } & input.map { |row| row.min }
end
