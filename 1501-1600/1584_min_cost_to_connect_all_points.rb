# @param {Integer[][]} points
# @return {Integer}
def min_cost_connect_points(points)
    min_distances = Array.new(points.size, Float::INFINITY)
    cost = 0
    (0...points.size-1).each do |i|
        (i+1...points.size).each do |j|
            d = (points[i][0] - points[j][0]).abs + (points[i][1] - points[j][1]).abs
            min_distances[j] = d if min_distances[j] > d
            if min_distances[j] < min_distances[i+1]
                points[i+1], points[j] = points[j], points[i+1]
                min_distances[i+1], min_distances[j] = min_distances[j], min_distances[i+1]
            end
        end
        cost += min_distances[i+1]
    end

    cost
end
