# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def in_order(node)
    return [] if node.nil?

    in_order(node.left) + [node] + in_order(node.right)
end

def build_bst(order_nodes)
    return if order_nodes.empty?

    m = order_nodes.length/2
    root = order_nodes[m]
    root.left = build_bst(order_nodes[0...m])
    root.right = build_bst(order_nodes[m+1..])
    root
end

# @param {TreeNode} root
# @return {TreeNode}
def balance_bst(root)
    order_nodes = in_order(root)
    build_bst(order_nodes)
end
