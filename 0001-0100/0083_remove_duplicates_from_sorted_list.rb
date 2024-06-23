# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
    node = head
    while node
        next_node = node.next
        while node.val == next_node&.val
            next_node = next_node.next
        end
        node.next = next_node
        node = next_node
    end

    head
end
