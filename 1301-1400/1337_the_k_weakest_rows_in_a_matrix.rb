# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[]}
def k_weakest_rows(mat, k)
    mat.map.with_index { |row, i| [row.bsearch_index { |x| x == 0 } || mat[0].size, i] }
       .sort { |(si, i), (sj, j)| si == sj ? i-j : si-sj }
       .slice(0, k)
       .map(&:last)
end
