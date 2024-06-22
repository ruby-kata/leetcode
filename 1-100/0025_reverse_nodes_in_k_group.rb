# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
    return head if head.nil? or k == 1

    p = head
    k.times do
        return head if p.nil?
        p = p.next
    end

    prev = nil
    q = head
    while q != p
        q_next = q.next
        q.next = prev
        prev = q
        q = q_next
    end

    head.next = reverse_k_group(p, k)
    prev
end
