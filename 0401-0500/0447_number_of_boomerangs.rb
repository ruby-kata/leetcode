# @param {Integer[][]} points
# @return {Integer}
def number_of_boomerangs(points)
    count = 0
    (0...points.length).each { |i|
        dist_counter = Hash.new(0)
        (0...points.length).each { |j|
            dist = (points[i][0] - points[j][0])**2 + (points[i][1] - points[j][1])**2
            # for each new boomerang point j, there're 2 boomerangs combine by j and each previous boomerang points
            count += 2 * dist_counter[dist]
            dist_counter[dist] += 1
        }
        # we also can count boomerangs each i by sum of Permutation(k, 2)
        # count += dist_counter.values.reduce(0) { |sum, k| sum += k*(k-1) }
    }

    count
end
