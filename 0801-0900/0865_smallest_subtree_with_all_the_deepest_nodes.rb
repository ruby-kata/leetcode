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
# @return {TreeNode}
def subtree_with_all_deepest(root)
    def dfs(node, d)
        return [d, node] if node.nil?

        dl, left = dfs(node.left, d+1)
        dr, right = dfs(node.right, d+1)
        return [dl, node] if dl == dr
        dl > dr ? [dl, left] : [dr, right]
    end

    d, node = dfs(root, 0)
    node
end
