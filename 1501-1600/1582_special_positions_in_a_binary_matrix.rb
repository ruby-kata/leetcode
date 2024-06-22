# @param {Integer[][]} mat
# @return {Integer}
def num_special(mat)
    rows = mat.size
    cols = mat[0].size
    sum_rows = Array.new(rows, 0)
    sum_cols = Array.new(cols, 0)

    (0...rows).each do |r|
        (0...cols).each do |c|
            sum_rows[r] += mat[r][c]
            sum_cols[c] += mat[r][c]
        end
    end

    count = 0
    (0...rows).each do |r|
        (0...cols).each do |c|
            count += 1 if mat[r][c] == 1 && sum_rows[r] == 1 && sum_cols[c] == 1
        end
    end

    count
end
