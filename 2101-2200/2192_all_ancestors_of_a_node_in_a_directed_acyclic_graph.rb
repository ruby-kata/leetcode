# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[][]}
def get_ancestors(n, edges)
    ancestors = Array.new(n) { [] }
    edges.each do |k, v|
        ancestors[v] << k
    end

    ancestors.map do |a|
        t = []
        visited = {}
        queue = a.clone
        until queue.empty?
            x = queue.shift
            next if visited.has_key?(x)
            
            visited[x] = true
            t << x
            queue += ancestors[x]
        end
        t.uniq.sort
    end
end
