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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root, from_root = true)
    return true if root.nil? && sub_root.nil?
    return false if root.nil? || sub_root.nil?

    if root.val == sub_root.val && 
        is_subtree(root.left, sub_root.left, false) && 
        is_subtree(root.right, sub_root.right, false)
        return true
    end
    
    from_root && (is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root))
end
