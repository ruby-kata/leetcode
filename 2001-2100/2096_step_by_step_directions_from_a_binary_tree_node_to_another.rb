# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} start_value
# @param {Integer} dest_value
# @return {String}
def get_directions(root, start_value, dest_value)
    return "" if start_value == dest_value

    start_path = dfs(root, start_value, "L") || dfs(root, start_value, "R")
    dest_path = dfs(root, dest_value, "L") || dfs(root, dest_value, "R")
    lca = nil
    while !start_path.empty? && !dest_path.empty? && start_path[-1][0].val == dest_path[-1][0].val
        start_path.pop
        lca = dest_path.pop
    end

    start_path.map { |node, step| "U" }
        .concat([lca[1]])
        .concat(dest_path.reverse.map { |node, step| step })
        .join
end

def dfs(node, target_val, step)
    return if node.nil?
    return [[node, nil]] if node.val == target_val

    next_node = step == "L" ? node.left : node.right

    l = dfs(next_node, target_val, "L")
    return l << [node, step] if l

    r = dfs(next_node, target_val, "R")
    return r << [node, step] if r

    nil
end
