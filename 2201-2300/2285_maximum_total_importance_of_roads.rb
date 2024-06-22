# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def maximum_importance(n, roads)
    indrees = Hash.new(0)
    adj = Hash.new { |h, k| h[k] = [] }
    roads.each do |(i, j)|
        indrees[i] += 1
        indrees[j] += 1
        adj[i].push(j)
        adj[j].push(i)
    end

    sorted = indrees.entries.sort_by(&:last).map(&:first)
    assign = Hash.new
    max = n
    (sorted.size-1).downto(0) do |i| 
        assign[sorted[i]] = max
        max -= 1
    end

    sum = 0
    adj.each do |i, arr|
        arr.each do |j|
            sum += assign[i] + assign[j]
        end
    end

    sum/2
end
