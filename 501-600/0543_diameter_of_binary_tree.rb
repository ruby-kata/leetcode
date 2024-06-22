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
def diameter_of_binary_tree(root)
    diameter = 0
    longest_path = -> (node) {
        return 0 if node.nil?
        left_max = node.left.nil? ? 0 : 1 + longest_path.call(node.left)
        right_max = node.right.nil? ? 0 : 1 + longest_path.call(node.right)
        diameter = left_max + right_max if diameter < left_max + right_max
        left_max >= right_max ? left_max : right_max
    }

    longest_path.call(root)
    diameter
end
