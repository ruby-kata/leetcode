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
def remove_zero_sum_sublists(head)
    prefix_sums = {}
    sum = 0
    p = prev_head = ListNode.new(0, head)
    while p
        sum += p.val
        prefix_sums[sum] = p
        p = p.next
    end

    p = prev_head
    sum = 0
    while p
        sum += p.val
        p.next = prefix_sums[sum].next
        p = p.next
    end

    prev_head.next
end
