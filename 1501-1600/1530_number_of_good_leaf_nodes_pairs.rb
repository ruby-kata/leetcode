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
# @param {Integer} distance
# @return {Integer}
def count_pairs(root, distance)
    count = 0
    dfs = lambda { |node, dist|
        return [0] if node.left.nil? && node.right.nil?

        l = node.left ? dfs.call(node.left, dist) : []
        r = node.right ? dfs.call(node.right, dist) : []
        l = l.map { |d| d + 1 }
        r = r.map { |d| d + 1 }

        if !l.empty? && !r.empty?
            l.each { |dl|
                r.each { |dr|
                    count += 1 if dl + dr <= dist
                }
            }
        end

        (l + r).reject { |d| d >= dist }
    }

    dfs.call(root, distance)

    count
end
