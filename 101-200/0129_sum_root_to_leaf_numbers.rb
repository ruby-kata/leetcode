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
def sum_numbers(root, num_path = "")
    return 0 if root.nil?

    num_path = num_path + root.val.to_s
    return num_path.to_i if root.left.nil? && root.right.nil?

    sum_numbers(root.left, num_path) + sum_numbers(root.right, num_path)
end
