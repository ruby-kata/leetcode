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
def postorder(root, order = [])
    return order if root.nil?

    root.children.each do |node|
        postorder(node, order)
    end
    
    order.push(root.val)
    order
end
