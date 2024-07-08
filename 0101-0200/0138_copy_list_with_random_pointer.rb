# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
    ref = Hash.new
    copy = Node.new(nil)
    node = head
    copy_node = copy
    while node
        copy_node = copy_node.next = Node.new(node.val)
        copy_node.random = node.random
        ref[node] = copy_node
        node = node.next
    end

    copy_node = copy
    while copy_node.next
        copy_node = copy_node.next
        copy_node.random = ref[copy_node.random] unless copy_node.random.nil?
    end

    copy.next
end
