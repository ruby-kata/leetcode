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
# @return {ListNode[]}
def split_list_to_parts(head, k)
    len = 0 
    p = head
    while p
        len += 1
        p = p.next
    end

    part_size = len/k
    remain = len % k
    parts = []
    p = head
    while p
        parts << p
        # to reach the next part ListNode, jump part_size-1 times, 
        # since "parts occurring earlier should always have a size greater than or equal to parts occurring later"
        # so if remain still there, jump one more time
        (part_size + ((remain -= 1) >= 0 ? 0 : -1)).times {
            break if p.nil?
            p = p.next
        }
        break if p.nil?

        next_p = p.next
        p.next = nil
        p = next_p
    end

    parts + [[]] * (k - parts.size)
end
