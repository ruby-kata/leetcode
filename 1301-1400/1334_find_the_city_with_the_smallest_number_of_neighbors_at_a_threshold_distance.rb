# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} distance_threshold
# @return {Integer}
def find_the_city(n, edges, distance_threshold)
    shortest_dist = floy_warshall(n, edges)
    
    min = Float::INFINITY
    min_index = nil
    (0...n).each { |i|
        count = 0
        (0...n).each { |j|
            count += 1 if shortest_dist[i][j] <= distance_threshold
        }
        
        if min >= count
            min = count
            min_index = i
        end
    }

    min_index
end

# https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm
def floy_warshall(n, edges)
    dist = Array.new(n) { Array.new(n, Float::INFINITY) }
    
    edges.each { |u, v, w|
        dist[u][v] = w
        dist[v][u] = w
    }

    (0...n).each { |u|
        dist[u][u] = 0
    }

    (0...n).each { |k|
        (0...n).each { |i|
            (0...n).each { |j|
                dist[i][j] = [dist[i][j], dist[i][k] + dist[k][j]].min
            }
        }
    }

    dist
end
