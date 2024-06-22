# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
    return [0] if n == 1
    
    indegrees = Array.new(n, 0)
    adj = Hash.new { |h, k| h[k] = [] }
    edges.each do |(a, b)|
        adj[a].push(b)
        adj[b].push(a)
        indegrees[a] += 1
        indegrees[b] += 1
    end

    mht = []
    (0...n).each do |i|
        mht.push(i) if indegrees[i] == 1
    end

    loop do
        next_layer = []
        mht.each do |i|
            adj[i].each do |j|
                indegrees[j] -= 1
                next_layer.push(j) if indegrees[j] == 1
            end
        end
        break if next_layer.empty?
        mht = next_layer
    end

    mht
end
