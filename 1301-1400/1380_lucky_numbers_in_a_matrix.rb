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

    min_rows.each_with_index do |col_index, row_index|
        # we can prove that there's only one lucky number 
        # given the input matrix contains only distinct numbers
        # now let suppose [i,j] is the lucky number
        # we assume that there's another lucky number [u,v] 
        # so we have: m[u][v] is the min of the row u => m[u][v] < m[u][j] < m[i][j]
        # we also have: m[u][v] is the max of the col v => m[u][v] > m[i][v] > m[i][j]
        # => m[u][v] < m[i][j] && m[u][v] > m[i][j] ==> wrong
        # so either there's no [u,v] or [u,v] is [i,j], 
        # but the matrix contains only distinct numbers, so there's only one luck number.
        return [matrix[row_index][col_index]] if max_cols[col_index] == row_index
    end

    []
end

# more ruby style
def lucky_numbers (input)
    input.transpose.map { |col| col.max } & input.map { |row| row.min }
end
