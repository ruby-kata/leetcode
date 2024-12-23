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
def minimum_operations(root)
    count = 0
    queue = [root]
    until queue.empty?
        sorted_index = queue.map.with_index { |node, i| [node.val, i] }.sort_by(&:first).map(&:last)

        (0...sorted_index.size).each { |i|
            while (j = sorted_index[i]) != i
                count += 1
                sorted_index[i], sorted_index[j] = sorted_index[j], sorted_index[i]
            end
        }

        next_queue = []
        queue.each { |node|
            next_queue << node.left if node.left
            next_queue << node.right if node.right
        }
        queue = next_queue
    end

    count
end
