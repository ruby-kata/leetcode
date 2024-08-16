def max_distance(arrs)
    max_dist = 0
    max_num = -Float::INFINITY
    min_num = Float::INFINITY

    arrs.each { |arr|
        # note: you have to pick up two integers from two different arrays
        max_dist = [max_dist, arr[-1] - min_num, max_num - arr[0]].max
        max_num = [max_num, arr[-1]].max
        min_num = [min_num, arr[0]].min
    }

    max_dist
end
