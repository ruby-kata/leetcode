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
def merge_nodes(head)
    return nil if head.nil? || head.next.nil?
    
    p = head.next
    until p.nil? || p.val.zero?
        head.val += p.val
        p = p.next
    end

    head.next = merge_nodes(p)
    head
end
