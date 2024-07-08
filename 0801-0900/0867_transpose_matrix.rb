# @param {Integer[][]} matrix
# @return {Integer[][]}
def transpose(matrix)
    m = matrix.size
    n = matrix[0].size

    t = Array.new(n) { Array.new(m) }
    (0...n).each do |r|
        (0...m).each do |c|
            t[r][c] = matrix[c][r]
        end
    end

    t
end
