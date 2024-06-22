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
def find_second_minimum_value(root)
    min = root.val
    l_second_min = r_second_min = -1

    if root.left
        l_second_min = root.left.val > min ? root.left.val : find_second_minimum_value(root.left)
    end

    if root.right
        r_second_min = root.right.val > min ? root.right.val : find_second_minimum_value(root.right)
    end

    if l_second_min == -1
        r_second_min
    elsif r_second_min == -1
        l_second_min
    else
        [l_second_min, r_second_min].min
    end
end
