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
# @return {Integer[][]}
def level_order_bottom(root)
    return [] if root.nil?
    
    levels = []
    level = [root]
    until level.empty?
        values = []
        size = level.size
        (0...size).each do |i|
            node = level.shift
            values.push(node.val)
            level.push(node.left) unless node.left.nil?
            level.push(node.right) unless node.right.nil?
        end

        levels.unshift(values)
    end

    levels
end
