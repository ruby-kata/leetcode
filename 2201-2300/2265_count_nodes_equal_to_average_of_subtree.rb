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
def average_of_subtree(root)
    counter = 0
    postorder = -> (node) {
        return [0, 0] if node.nil?

        sum_l, count_l = postorder.call(node.left)
        sum_r, count_r = postorder.call(node.right)

        sum = sum_l + sum_r + node.val
        n = count_l + count_r + 1
        counter += 1 if sum/n == node.val
        return [sum, n]
    }   

    postorder.call(root)
    counter
end
