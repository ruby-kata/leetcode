# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def leaf_similar(root1, root2)
    def get_leafs(root)
        return [] if root.nil?
        return [root.val] if root.left.nil? and root.right.nil?

        get_leafs(root.left) + get_leafs(root.right)
    end

    get_leafs(root1) == get_leafs(root2)
end
