# @param {Integer[][]} is_water
# @return {Integer[][]}
def highest_peak(is_water)
    r = is_water.size
    c = is_water[0].size
    result = Array.new(r) { Array.new(c, Float::INFINITY) }
    
    queue = []
    (0...r).each { |i|
        (0...c).each { |j|
            if is_water[i][j] == 1
                result[i][j] = 0
                queue << [i, j]
            end
        }
    }

    directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    until queue.empty?
        i, j = queue.shift
        directions.each { |dr, dc|
            _i = i + dr
            _j = j + dc
            next if _i < 0 || _i >= r || _j < 0 || _j >= c

            queue << [_i, _j] if result[_i][_j] == Float::INFINITY
            result[_i][_j] = [result[_i][_j], result[i][j] + 1].min
        }
    end

    result
end
