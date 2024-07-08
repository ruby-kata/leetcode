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
def find_mode(root)
    modes = []
    pred = nil
    count = 0
    max = 0

    dfs = -> (node) {
        return if node.nil?

        dfs.call(node.left)
        
        if !pred.nil? && pred.val == node.val
            count += 1
        else
            count = 1
        end

        if count == max
            modes.push(node.val)
        elsif count > max
            max = count
            modes = [node.val]
        end

        pred = node

        dfs.call(node.right)
    }

    dfs.call(root)
    modes
end
