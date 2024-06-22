# @param {Integer[][]} points
# @return {Integer}
def min_time_to_visit_all_points(points)
    points.each_cons(2).reduce(0) { |acc, ((x1, y1), (x2, y2))| acc + [(x1-x2).abs, (y1-y2).abs].max }
end
