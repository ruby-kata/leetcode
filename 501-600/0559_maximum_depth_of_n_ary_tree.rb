# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {int}
def maxDepth(root, depth = 0)
    return depth if root.nil?
    return depth + 1 if root.children.empty?

    root.children.map { |c|
        maxDepth(c, depth + 1)
    }.max
end
