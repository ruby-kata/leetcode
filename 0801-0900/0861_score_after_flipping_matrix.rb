# @param {Integer[][]} grid
# @return {Integer}
def matrix_score(grid)
    rows_size = grid.length
    cols_size = grid[0].length

    rows = Array.new(rows_size, 0)
    (0...rows_size).each do |i|
        (0...cols_size).each do |j|
            rows[i] |= (grid[i][j] << (cols_size - 1 - j))
        end
    end

    (0...rows_size).each do |i|
        if (rows[i] >> (cols_size - 1)) == 0
            rows[i] ^= ((1 << cols_size) - 1)
        end
    end

    (1...cols_size).each do |j|
        ones = rows.inject(0) { |sum, row| sum += ((row >> (cols_size - 1 - j)) & 1) }
        if ones < rows_size/2.0
            (0...rows_size).each do |i|
                rows[i] ^= (1 << (cols_size - 1 - j))
            end
        end
    end

    rows.sum
end
