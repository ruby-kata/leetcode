# brute-force
# @param {Integer[][]} grid
# @return {Integer}
def num_magic_squares_inside(grid)
    check_magic_square = lambda { |r, c|
        appear = {}
        rows = Array.new(3, 0) 
        cols = Array.new(3, 0)
        cross = Array.new(2, 0) 
        (0...3).each { |i|
            (0...3).each { |j|
                num = grid[r + i][c + j]
                return false if num < 1 || num > 9
                return false if appear.has_key?(num)

                appear[num] = true
                rows[i] += num
                cols[j] += num
                cross[0] += num if i == j
                cross[1] += num if i == 2 - j
            }
        }

        return rows[0] == rows[1] && rows[1] == rows[2] &&
                rows[0] == cols[0] && cols[0] == cols[1] && cols[1] == cols[2] &&
                rows[0] == cross[0] && cross[0] == cross[1]
    }

    rows_size = grid.length
    cols_size = grid[0].length
    count = 0
    (0...rows_size-2).each { |r|
        (0...cols_size-2).each { |c|
            count += 1 if check_magic_square.call(r, c)
        }
    }

    count
end

# optimize
def num_magic_squares_inside(grid)
    # There are 8 ways of having 3 distinct numbers from 1-9 to sum up to 15
    # 9+5+1
    # 8+5+2
    # 7+5+3
    # 6+5+4
    # 9+4+2
    # 8+6+1
    # 8+4+3
    # 7+6+2
    #
    # Note that there're 4 sums with 5, 
    # that are sum of the 1-th row, 1-th col and 2 diagonals
    # That mean, 5 is the center cell.
    # there's 2 sums with 1/3/5/7(each), 
    # that are sum of the 1-th row and 1-th col
    # so 1/3/5/7 on the side
    # there's 3 sums with 2/4/6/8(each), 
    # that are sum of the row and col has the same corner and the diagonal from that corner
    # so 24/6/8 on the corner

    # so there're only below solutions
    #  4 3 8 | 8 3 4
    #  9 5 1 | 1 5 9
    #  2 7 6 | 6 7 2
    # and their's variants by rotating 4 edges around the 5  
    # if you concat 4 egdes, then rotating, for example, the solution above,
    # the solution must in: '4381672943816729'

    rows_size = grid.length
    cols_size = grid[0].length
    round_edges = [[0,0], [0,1], [0,2], [1,2], [2,2], [2,1], [2,0], [1,0]].freeze
    rotating = [
        '4381672943816729'.freeze,
        '8349276183492761'.freeze
    ]

    count = 0
    (0...rows_size-2).each { |r|
        (0...cols_size-2).each { |c|
            # check center is 5 and corner is even (2/4/6/8)
            if grid[r][c].even? && grid[r+1][c+1] == 5
                round_str = ''
                round_edges.each { |i, j|
                    num = grid[r+i][c+j]
                    break if num < 1 && num > 9
                    round_str << num.to_s
                }

                if round_str.length == 8
                    && rotating.any? { |r| r.include?(round_str) }
                    count += 1
                end
            end
        }
    }

    count
end
