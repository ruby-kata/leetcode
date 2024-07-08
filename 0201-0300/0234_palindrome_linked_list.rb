# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    len = 0
    prev = nil
    p = q = head
    until q.nil?
        len += q.next ? 2 : 1
        q = q.next&.next
        # reverse the first half
        n = p.next
        p.next = prev
        prev = p
        p = n
    end

    q = len.even? ? prev : prev.next
    until p.nil? || q.nil?
        return false if q.val != p.val

        p = p.next
        q = q.next
    end

    p.nil? && q.nil?
end
