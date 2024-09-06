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
def find_tilt(root)
    sum = 0
    dfs = lambda { |node|
        return 0 if node.nil?

        l = dfs.call(node.left)
        r = dfs.call(node.right)
        sum += (l - r).abs
        l + r + node.val
    }

    dfs.call(root)
    sum
end
