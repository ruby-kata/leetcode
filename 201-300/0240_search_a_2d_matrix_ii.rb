# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    rows = matrix.size
    cols = matrix[0].size
    if Math.log(cols) * rows < cols + rows
        (0...rows).each do |row|
            break if matrix[row][0] > target

            l = 0
            r = cols - 1
            while l <= r
                m = (l + r) / 2
                return true if matrix[row][m] == target

                if matrix[row][m] > target
                    r = m - 1
                else
                    l = m + 1
                end
            end
        end
        false
    else
        row = 0
        col = cols - 1
        while row < rows && col >= 0
            return true if matrix[row][col] == target

            if matrix[row][col] > target
                col -= 1
            else
                row += 1
            end
        end
        false
    end
end
