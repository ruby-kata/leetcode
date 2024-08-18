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
def insert_greatest_common_divisors(head)
    return head if head.next.nil?

    prev = head
    curr = head.next

    until curr.nil?
        gcd = curr.val.gcd(prev.val)
        prev.next = ListNode.new(gcd, curr)
        prev = curr
        curr = curr.next
    end

    return head
end
