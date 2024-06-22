# @param {Integer[][]} adjacent_pairs
# @return {Integer[]}
def restore_array(adjacent_pairs)
    adj = Hash.new { |h, k| h[k] = [] }
    adjacent_pairs.each do |u, v|
        adj[u] << v
        adj[v] << u
    end

    u, vs = adj.find { |k, v| v.size == 1 }
    ans = [u, vs[0]]
    while ans.size < adj.size
        u, v = adj[ans.last]
        if u != ans[-2]
            ans << u
        else
            ans << v
        end
    end

    ans
end
