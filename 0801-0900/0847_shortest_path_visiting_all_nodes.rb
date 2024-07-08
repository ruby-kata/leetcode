# @param {Integer[][]} graph
# @return {Integer}
def shortest_path_length(graph)
    visited_all = (1 << graph.size) - 1
    visited = Hash.new(false)
    queue = []
    (0...graph.size).each do |i|
        queue.push([i, (1 << i)])
    end

    count = 0
    until queue.empty?
        size = queue.size
        size.times do
            i, state = visit = queue.shift
            return count if state == visited_all
            next if visited[visit]

            visited[visit] = true
            graph[i].each do |j|
                queue.push([j, state | (1 << j)])
            end
        end
        count += 1
    end
end
