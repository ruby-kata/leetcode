# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} indices
# @return {Integer}
def odd_cells(m, n, indices)
    rows = Array.new(m, 0)
    cols = Array.new(n, 0)

    indices.each do |i, j|
        rows[i] += 1
        cols[j] += 1
    end

    odd_rows = rows.count(&:odd?)
    odd_cols = cols.count(&:odd?)

    odd_rows * (n - odd_cols) + odd_cols * (m - odd_rows)
end
