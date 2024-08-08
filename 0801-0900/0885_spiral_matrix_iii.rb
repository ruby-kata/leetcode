# @param {Integer} rows
# @param {Integer} cols
# @param {Integer} r_start
# @param {Integer} c_start
# @return {Integer[][]}
def spiral_matrix_iii(rows, cols, r_start, c_start)
    path = []
    size = rows * cols
    r = r_start
    c = c_start
    d = 0
    loop do
        # bot-left -> up-left
        (0..d).each { |y|
            _r = r - y
            path.push([_r, c]) if c >= 0 && c < cols && _r >= 0 && _r < rows 
        }
        r -= d

        d += 1

        # up-left -> up-right
        (1..d).each { |x|
            _c = c + x
            path.push([r, _c]) if _c >= 0 && _c < cols && r >= 0 && r < rows
        }
        c += d

        # up-right -> bot-right
        (1..d).each { |y|
            _r = r + y
            path.push([_r, c]) if c >= 0 && c < cols && _r >= 0 && _r < rows
        }
        r += d

        # bot-right -> bot-left
        (1..d).each { |x|
            _c = c - x
            path.push([r, _c]) if _c >= 0 && _c < cols && r >= 0 && r < rows
        }
        c -= d

        d += 1
        c -= 1
        break if path.size >= size
    end

    path
end
