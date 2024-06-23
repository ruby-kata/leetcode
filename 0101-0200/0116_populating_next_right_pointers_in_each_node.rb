# Definition for Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def connect(root)
    level_left_most = root
    while level_left_most
        node = level_left_most
        chain = Node.new
        while node && node.left
            chain.next = node.left
            chain = chain.next
            chain.next = node.right
            chain = chain.next
            node = node.next
        end
        level_left_most = level_left_most.left
    end

    root
end
