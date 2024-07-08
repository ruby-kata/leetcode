# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def sum(node, greater = 0)
    return greater if node.nil?

    sum_r = sum(node.right, greater)
    node.val += sum_r
    if node.left
        sum(node.left, node.val)
    else
        node.val
    end
end

# @param {TreeNode} root
# @return {TreeNode}
def bst_to_gst(root)
    sum(root)
    root
end
