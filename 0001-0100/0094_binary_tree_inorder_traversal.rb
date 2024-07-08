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
# @return {Integer[]}
def inorder_traversal(root)
    order = []
    stack = []
    while root || !stack.empty?
        while root
            stack.unshift(root)
            root = root.left
        end

        root = stack.shift
        order.push(root.val)
        root = root.right
    end

    order
end
