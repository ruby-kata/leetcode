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
# @return {String}
def tree2str(root)
    return "" if root.nil?
    
    str = "#{root.val}"
    return str if root.left.nil? && root.right.nil?
    
    str += root.left.nil? ? "()" : "(#{tree2str(root.left)})"
    str += root.right.nil? ? "" : "(#{tree2str(root.right)})"
    str
end
