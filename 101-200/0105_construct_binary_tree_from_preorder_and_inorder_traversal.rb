# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
    return if preorder.empty?
    
    split_index = inorder.find_index { |x| x == preorder[0] }
    root = TreeNode.new(preorder[0])
    root.left = build_tree(preorder[1..split_index], inorder[0...split_index])
    root.right = build_tree(preorder[split_index+1..], inorder[split_index+1..])

    root
end
