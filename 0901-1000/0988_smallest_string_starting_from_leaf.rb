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
# @return {String}
def smallest_from_leaf(root)
    min = '}'
    dfs = lambda { |node, path|
        c = (97 + node.val).chr
        path = c + path

        if node.left.nil? && node.right.nil?
            min = path if min > path
            return
        end
        
        dfs.call(node.left, path) if node.left
        dfs.call(node.right, path) if node.right
    }

    dfs.call(root, '')
    min
end
