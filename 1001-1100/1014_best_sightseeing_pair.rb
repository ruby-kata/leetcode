# @param {Integer[]} values
# @return {Integer}
def max_score_sightseeing_pair(values)
    # dp, greedy
    prev_max = 0
    dis = 0
    max_score = 0
    values.each { |v|
        max_score = [max_score, v + prev_max - dis].max
        if v >= prev_max - dis
            prev_max = v
            dis = 0
        end
        dis += 1
    }

    max_score
end
