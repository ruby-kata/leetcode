# @param {Integer} upper
# @param {Integer} lower
# @param {Integer[]} colsum
# @return {Integer[][]}
def reconstruct_matrix(upper, lower, colsum)
    m = Array.new(2) { Array.new(colsum.size).fill(0) }
    colsum.each_with_index do |sum, i|
        next if sum == 0
        return [] if upper <= 0 && lower <= 0

        if sum == 2
            upper -= 1
            lower -= 1
            m[0][i] = 1
            m[1][i] = 1
        else
            if upper >= lower
                upper -= 1
                m[0][i] = 1
            else
                lower -= 1
                m[1][i] = 1
            end
        end
    end

    upper == 0 && lower == 0  ? m : []
end
