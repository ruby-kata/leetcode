# @param {Integer[][]} grid
# @return {Integer}
def minimum_area(grid)
    min_w = Float::INFINITY
    max_w = 0
    min_h = 0
    max_h = 0

    grid.each_with_index do |row, i|
        if first_one = row.index(1)
            min_w = [min_w, first_one].min
            max_w = [max_w, row.rindex(1)].max
            min_h = i + 1 if min_h == 0
            max_h = i + 1
        end
    end

    (max_h - min_h + 1) * (max_w - min_w + 1)
end
