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
def swap_pairs(head)
    return head if head.nil? or head.next.nil?

    prev = nil
    first = head
    second = first.next
    head = head.next
    until second.nil?
        third = second.next
        second.next = first
        first.next = third
        prev.next = second unless prev.nil?

        prev = first
        first = third
        second = first&.next
    end

    head
end


# recursive
def swap_pairs(head)
    return nil if head.nil?
    next_pointer = head.next
    unless next_pointer.nil?
        next_next_pointer =  swap_pairs(next_pointer.next)
        next_pointer.next = head
        head.next = next_next_pointer
        next_pointer
    else    
        head
    end
end
