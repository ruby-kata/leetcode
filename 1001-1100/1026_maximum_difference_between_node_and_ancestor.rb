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
def max_ancestor_diff(root, max = root.val, min = root.val)
    return 0 if root.nil?

    diff = [(max - root.val).abs, (min - root.val).abs].max
    max = root.val if root.val > max
    min = root.val if root.val < min

    [diff, max_ancestor_diff(root.left, max, min), max_ancestor_diff(root.right, max, min)].max
end
