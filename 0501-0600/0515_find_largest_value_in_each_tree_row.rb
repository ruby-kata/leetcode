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
# @return {Integer[]}
def largest_values(root)
    return [] if root.nil?
    
    maxes = []
    queue = [root]
    until queue.empty?
        max = -Float::INFINITY
        queue.size.times do
            node = queue.shift
            max = node.val if max < node.val
            queue.push(node.left) if node.left
            queue.push(node.right) if node.right
        end

        maxes << max
    end

    maxes
end
