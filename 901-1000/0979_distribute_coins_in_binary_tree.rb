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
# @return {Integer}
def distribute_coins(root)
    return 0 if root.nil?

    move_left = distribute_coins(root.left)
    move_right = distribute_coins(root.right)

    root.val += -1 + (root.left&.val || 0) + (root.right&.val || 0)

    move_left + move_right + root.val.abs
end
