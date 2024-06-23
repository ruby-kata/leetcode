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
# @return {Integer[][]}
def level_order(root)
    return [] if root.nil?

    level_vals = []
    level_nodes = [root]
    while level_nodes.size > 0
        level_vals << level_nodes.map(&:val)

        next_level_nodes = []
        level_nodes.each do |node|
            next_level_nodes << node.left unless node.left.nil?
            next_level_nodes << node.right unless node.right.nil?
        end
        level_nodes = next_level_nodes
    end

    level_vals
end
