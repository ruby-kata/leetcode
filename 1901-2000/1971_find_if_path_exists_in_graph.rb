# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} source
# @param {Integer} destination
# @return {Boolean}
def valid_path(n, edges, source, destination)
    graph = Hash.new { |h, k| h[k] = [] }
    edges.each do |u, v|
        graph[u] << v
        graph[v] << u
    end

    visited = Hash.new(false)
    queue = [source]
    until queue.empty?
        node = queue.shift
        return true if node == destination
        next if visited[node]

        visited[node] = true
        queue += graph[node]
    end

    false
end
