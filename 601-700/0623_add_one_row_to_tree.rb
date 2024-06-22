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
# @param {Integer} val
# @param {Integer} depth
# @return {TreeNode}
def add_one_row(root, val, depth)
    if depth == 1
        return TreeNode.new(val).tap do |node|
            node.left = root
        end
    end

    nodes = [root]
    (depth-2).times do
        (nodes.size).times do
            node = nodes.shift
            nodes.push(node.left) if node.left
            nodes.push(node.right) if node.right
        end
    end

    nodes.each do |node|
        depth_node = TreeNode.new(val)
        depth_node.left = node.left
        node.left = depth_node

        depth_node = TreeNode.new(val)
        depth_node.right = node.right
        node.right = depth_node
    end

    root
end
