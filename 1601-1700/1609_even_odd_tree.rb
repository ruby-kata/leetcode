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
# @return {Boolean}
def is_even_odd_tree(root)
    level = 0
    queue = [root]
    until queue.empty?
        level_mod = level % 2
        prev_node = nil
        queue.size.times do
            node = queue.shift
            return false if node.val % 2 == level_mod
            return false if level_mod == 0 && (node.val - (prev_node&.val || 0)) <= 0
            return false if level_mod == 1 && ((prev_node&.val || Float::INFINITY) - node.val) <= 0

            prev_node = node
            queue.push(node.left) if node.left
            queue.push(node.right) if node.right
        end
        level += 1
    end

    true
end
