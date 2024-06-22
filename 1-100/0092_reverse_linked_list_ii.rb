# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
    before_left = left_node = prev = nil
    p = head
    i = 1
    while i <= left
        i += 1
        before_left = prev
        left_node = prev = p
        p = p.next
    end

    while i <= right && p
        i += 1
        temp = p
        p = p.next
        temp.next = prev
        prev = temp
    end
    
    if before_left.nil?
        head = prev
    else 
        before_left.next = prev
    end
    left_node.next = p

    head
end
