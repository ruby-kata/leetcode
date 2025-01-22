# @param {Integer[][]} is_water
# @return {Integer[][]}
def highest_peak(is_water)
    rows = is_water.size
    cols = is_water[0].size
    heights = Array.new(rows) { Array.new(cols, Float::INFINITY) }

    queue = []
    (0...rows).each { |r|
        (0...cols).each { |c|
            if is_water[r][c] == 1
                queue << [r, c]
                heights[r][c] = 0
            end
        }
    }

    directions = [[-1,0],[1,0],[0,-1],[0,1]].freeze
    current_height = 0
    until queue.empty?
        queue.size.times do
            r, c = queue.shift
            directions.each { |dr, dc|
                new_r = r + dr
                new_c = c + dc
                if new_r >= 0 && new_r < rows && new_c >= 0 && new_c < cols && heights[new_r][new_c] == Float::INFINITY
                    queue << [new_r, new_c]
                    heights[new_r][new_c] = current_height + 1
                end
            }
        end
        current_height += 1
    end

    heights
end
