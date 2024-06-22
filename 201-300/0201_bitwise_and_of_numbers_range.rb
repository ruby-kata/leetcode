# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_bitwise_and(left, right)
    shift_count = 0
    until left == right
        left >>= 1
        right >>= 1
        shift_count += 1
    end

    right << shift_count
end
