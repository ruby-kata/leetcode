# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
    p = q = head
    while q && q.next
        p = p.next
        q = q.next.next
    end

    pn = p.next
    p.next = nil
    p = pn
    
    # reverse the right half
    prev = nil
    while p
        n = p.next
        p.next = prev
        prev = p
        p = n
    end

    # reorder
    p = prev
    q = head
    while q && p
        qn = q.next
        q.next = p
        pn = p.next
        p.next = qn
        q = qn
        p = pn
    end
end
