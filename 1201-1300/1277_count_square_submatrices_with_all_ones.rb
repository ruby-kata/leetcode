# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(matrix)
    count = 0
    (0...matrix.length).each { |i|
        (0...matrix[0].length).each { |j|
            if matrix[i][j] == 1 && i > 0 && j > 0
                matrix[i][j] += [matrix[i][j-1], matrix[i-1][j], matrix[i-1][j-1]].min
            end
            count += matrix[i][j]
        }
    }

    count
end
