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
# @param {Integer[]} to_delete
# @return {TreeNode[]}
def del_nodes(root, to_delete)
    to_delete = to_delete.map { |d| [d, true] }.to_h
    forest = dfs(root, to_delete)
    forest << root unless to_delete.has_key?(root.val)
    forest
end

def dfs(node, to_delete)
    return [] if node.nil?

    trees = []
    
    left = node.left
    if to_delete.has_key?(left&.val)
        node.left = nil
    elsif to_delete.has_key?(node.val)
        trees << left if left
    end
    trees += dfs(left, to_delete)

    right = node.right
    if to_delete.has_key?(right&.val)
        node.right = nil
    elsif to_delete.has_key?(node.val)
        trees << right if right
    end
    trees += dfs(right, to_delete)

    trees
end
