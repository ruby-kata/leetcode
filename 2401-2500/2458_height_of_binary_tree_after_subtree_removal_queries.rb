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
# @param {Integer[]} queries
# @return {Integer[]}
def tree_queries(root, queries)
    height = Hash.new(0)
    cal_height = lambda { |node|
        return 0 if node.nil?
        height[node.val] = 1 + [cal_height.(node.left), cal_height.(node.right)].max
    }
    cal_height.(root)

    max_height = Hash.new(0)
    cal_max_height = lambda { |node, parent_height, level|
        return 0 if node.nil?

        max_height[node.val] = parent_height
        # if we remove the right
        # then the max height is the max between the parent and the left
        cal_max_height.(
            node.right, 
            [parent_height, level + height[node.left&.val]].max, 
            level + 1
        )
        # if we remove the left
        # then the max height is the max between the parent and the right
        cal_max_height.(
            node.left, 
            [parent_height, level + height[node.right&.val]].max, 
            level + 1
        )
    }
    # It is guaranteed that queries[i] will not be equal to the value of the root.
    # we don't count the root
    cal_max_height.(root, 0, 0)

    queries.map { |val| max_height[val] }
end
