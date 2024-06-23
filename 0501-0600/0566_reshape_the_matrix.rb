# @param {Integer[][]} mat
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(mat, r, c)
    return mat if mat.size * mat[0].size != r * c

    arr = mat.flatten
    reshape = []
    until arr.empty?
        reshape << arr.slice!(0,c)
    end

    reshape
end
