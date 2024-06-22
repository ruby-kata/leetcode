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
def sum_of_left_leaves(root)
    sum = 0
    return sum if root.nil?

    if root.left && root.left.left.nil? && root.left.right.nil?
        sum += root.left.val
    else
        sum += sum_of_left_leaves(root.left)
    end

    sum += sum_of_left_leaves(root.right)
    
    sum
end
