# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
    lesser = prev_head = ListNode.new(-Float::INFINITY, head)
    greater = head
    prev_greater = head

    while greater
        if greater.val < x
            next_greater = greater.next
            prev_greater.next = next_greater
            if lesser.next != greater
                greater.next = lesser.next
                lesser.next = greater
            else
                prev_greater = next_greater
            end
            lesser = lesser.next
            greater = next_greater
        else
            prev_greater = greater
            greater = greater.next
        end
    end

    prev_head.next
end
