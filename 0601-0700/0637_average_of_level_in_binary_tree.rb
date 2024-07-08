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
# @return {Float[]}
def average_of_levels(root)
    average = []
    level = [root]
    until level.empty?
        size = level.size
        sum = 0.0
        (0...size).each do |i|
            node = level.shift()
            sum += node.val
            level.push(node.left) unless node.left.nil?
            level.push(node.right) unless node.right.nil?
        end
        average.push(sum/size)
    end

    average
end
