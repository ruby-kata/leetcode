# @param {Integer[][]} matrix
# @return {Integer}
def largest_submatrix(matrix)
    heights = Array.new(matrix.size) { Array.new(matrix[0].size, 0) }
    (0...matrix[0].size).each do |c|
        (0...matrix.size).each do |r|
            heights[r][c] = heights[r-1][c] + 1 if matrix[r][c] > 0
        end
    end

    max = 0
    heights.each do |row_heights|
        row_heights.sort!.reverse!
        row_heights.each_with_index do |h, i|
            break if h <= 0
            area = h * (i+1)
            max = area if max < area
        end
    end

    max
end
