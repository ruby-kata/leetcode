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
def reverse_list(head)
    prev = nil
    cur = head
    until cur.nil?
        n = cur.next
        cur.next = prev
        prev = cur
        cur = n
    end

    prev
end

# recursive
def reverse_list(head)
    return head if head.nil? || head.next.nil?

    rev = reverse_list(head.next)
    head.next.next = head
    head.next = nil
    rev
end

