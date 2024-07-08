# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    rlo = 0
    rhi = matrix.size-1
    while rlo <= rhi
        rm = (rlo + rhi) >> 1
        return true if target == matrix[rm][0]
        if target < matrix[rm][0]
            rhi = rm - 1
        else
            rlo = rm + 1
        end
    end
    r = [rlo, rhi].min

    clo = 0
    chi = matrix[r].size-1
    while clo <= chi
        cm = (clo + chi) >> 1
        return true if target == matrix[r][cm]
        if target < matrix[r][cm]
            chi = cm - 1
        else
            clo = cm + 1
        end
    end

    false
end
