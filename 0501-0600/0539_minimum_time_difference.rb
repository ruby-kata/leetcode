# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
    sorted_times = time_points.map { |t| 
        h, m = t.split(":") 
        h.to_i * 60 + m.to_i
    }.sort!
    # since it's circular, the first time after 00:00 can count as after 24:00
    sorted_times << sorted_times.first + (24 * 60)

    sorted_times.each_cons(2).map { |t1, t2| t2 - t1 }.min
end
