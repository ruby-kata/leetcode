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
def delete_middle(head)
    prev = nil
    slow = head
    fast = head
    until fast.nil? || fast.next.nil?
        prev = slow
        slow = slow.next
        fast = fast.next.next
    end

    return prev if prev.nil?

    prev.next = slow.next
    head
end
