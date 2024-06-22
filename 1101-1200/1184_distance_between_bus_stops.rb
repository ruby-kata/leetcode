# @param {Integer[]} distance
# @param {Integer} start
# @param {Integer} destination
# @return {Integer}
def distance_between_bus_stops(distance, start, destination)
    s, d = start <= destination ? [start, destination] : [destination, start]
    [
        distance[s...d].sum,
        distance[d..].sum + distance[0...s].sum
    ].min
end
