# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root, order = [])
    return order if root.nil?
    
    order.push(root.val)
    root.children.each do |node|
        preorder(node, order)
    end

    order
end
