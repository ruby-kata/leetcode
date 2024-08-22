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
def rob(root)
    dfs = lambda { |node|
        return [0, 0] if node.nil?

        rob_left, not_rob_left = dfs.call(node.left)
        rob_right, not_rob_right = dfs.call(node.right)

        [
            # rob the parent node
            # so cannot rob both children
            node.val + not_rob_left + not_rob_right,
            # not rob the parent
            # so each child, we have 2 choice: rob or not rob, take the max
            [rob_left, not_rob_left].max + [rob_right, not_rob_right].max
        ]
    }

    dfs.call(root).max
end
