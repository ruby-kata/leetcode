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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
    return false if root.nil?

    remain = target_sum - root.val
    return true if remain.zero? and root.left.nil? and root.right.nil?

    has_path_sum(root.left, remain) or has_path_sum(root.right, remain)
end
