# @param {Integer} x
# @param {Integer} y
# @param {Integer[][]} points
# @return {Integer}
def nearest_valid_point(x, y, points)
    smallest_dis = Float::INFINITY
    smallest_index = -1
    points.each_with_index do |(px, py), i|
        next unless px == x || py == y

        dis = (px - x).abs + (py - y).abs
        if dis < smallest_dis
            smallest_index = i
            smallest_dis = dis
        end
    end

    smallest_index
end
