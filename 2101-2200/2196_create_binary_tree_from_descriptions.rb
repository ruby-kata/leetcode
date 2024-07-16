# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[][]} descriptions
# @return {TreeNode}
def create_binary_tree(descriptions)
    nodes = {}
    descriptions.each do |parent_val, child_val, is_left|
        child_node = nodes.dig(child_val, :tree_node) || TreeNode.new(child_val)
        parent_node = nodes.dig(parent_val, :tree_node) || TreeNode.new(parent_val)
        if is_left == 1
            parent_node.left = child_node
        else
            parent_node.right = child_node
        end

        nodes[parent_val] = {tree_node: parent_node, is_child: nodes[parent_val]&.fetch(:is_child)}
        nodes[child_val] = {tree_node: child_node, is_child: true}
    end

    nodes.values.find { |node| !node[:is_child] }.fetch(:tree_node)
end
