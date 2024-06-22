# @param {Integer[][]} points
# @return {Integer}
def max_width_of_vertical_area(points)
    widest = 0
    points.sort.each_cons(2) do |prev, curr|
        d = curr[0] - prev[0]
        widest = d if d > widest
    end

    widest
end
