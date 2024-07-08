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
# @param {Integer} k
# @return {Boolean}
def find_target(root, k)
    complements = Hash.new
    queue = [root]
    until queue.empty?
        node = queue.shift
        return true if complements.has_key?(node.val)

        complements[k - node.val] = true
        queue.push(node.left) if node.left
        queue.push(node.right) if node.right
    end

    false
end
