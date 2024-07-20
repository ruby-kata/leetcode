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
# @return {TreeNode}
def replace_value_in_tree(root)
    level = [root]
    until level.empty?
        children = []
        sum = 0
        level.each { |node| 
            if node.left
                children << node.left
                sum += node.left.val
            end
            
            if node.right
                children << node.right
                sum += node.right.val
            end
        }

        level.each { |node|
            cousins_sum = sum - ((node.left&.val || 0) + (node.right&.val || 0))
            node.left&.val = cousins_sum
            node.right&.val = cousins_sum
        }

        level = children
    end

    root.val = 0
    root
end
