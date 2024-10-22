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
# @param {Integer} k
# @return {Integer}
def kth_largest_level_sum(root, k)
    level_sums = []
    curr_level = [root]
    until curr_level.empty?
        level_sums << curr_level.map(&:val).sum
        curr_level.size.times {
            node = curr_level.shift
            curr_level << node.left if node.left
            curr_level << node.right if node.right
        }
    end

    level_sums.sort[-k] || -1
end
