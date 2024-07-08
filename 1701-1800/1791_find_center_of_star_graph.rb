# @param {Integer[][]} edges
# @return {Integer}
def find_center(edges)
    (edges[0] & edges[1]).first
end
