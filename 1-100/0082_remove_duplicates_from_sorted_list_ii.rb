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
    return head unless head

    prev_node = nil
    node = head
    head = nil
    while node
        if node.val == node.next&.val
            while node && node.val == node.next&.val
                node = node.next
            end
            node = node.next if node
        else
            if prev_node
                prev_node.next = node
            else
                head = node
            end
            prev_node = node
            node = node.next
        end
    end
    prev_node&.next = nil

    head
end
