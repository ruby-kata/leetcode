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
def postorder_traversal(root)
    order = []
    return order if root.nil?
    
    stack = [root]
    until stack.empty?
        top = stack.shift
        order.unshift(top.val)
        stack.unshift(top.left) if top.left
        stack.unshift(top.right) if top.right
    end

    order
end
