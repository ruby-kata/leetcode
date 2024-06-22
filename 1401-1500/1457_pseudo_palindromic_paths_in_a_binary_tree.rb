def count_set_bit(x)
    count = 0
    until x.zero?
        x &= (x-1)
        count += 1
    end
    count
end

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
def pseudo_palindromic_paths(root, bits = 0)
    return 0 if root.nil?

    bits ^= (1 << (root.val-1))
    if root.left.nil? and root.right.nil?
        count_set_bit(bits) <= 1 ? 1 : 0
    else
        pseudo_palindromic_paths(root.left, bits) + pseudo_palindromic_paths(root.right, bits)
    end
end
