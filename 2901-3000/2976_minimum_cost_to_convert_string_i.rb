# @param {String} source
# @param {String} target
# @param {Character[]} original
# @param {Character[]} changed
# @param {Integer[]} cost
# @return {Integer}
def minimum_cost(source, target, original, changed, cost)
    min_costs = Array.new(26) { Array.new(26, Float::INFINITY) }
    (0...26).each { |i| min_costs[i][i] = 0 }

    original.zip(changed).each_with_index { |(o, c), i|
        o_index = o.ord - 97
        c_index = c.ord - 97
        min_costs[o_index][c_index] = cost[i] if min_costs[o_index][c_index] > cost[i]        
    }

    # Floyd–Warshall algorithm
    # https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm
    (0...26).each { |k|
        (0...26).each { |i|
            (0...26).each { |j|
                min_costs[i][j] = [min_costs[i][j], min_costs[i][k] + min_costs[k][j]].min
            }
        }
    }

    sum = 0
    source.chars.zip(target.chars).each { |s, t|
        sum += min_costs[s.ord-97][t.ord-97]
    }

    sum == Float::INFINITY ? -1 : sum
end
