# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    slow = fast = head
    n.times { fast = fast.next }

    return slow.next if fast.nil?

    while fast.next
        fast = fast.next
        slow = slow.next
    end

    slow.next = slow.next&.next

    head
end
