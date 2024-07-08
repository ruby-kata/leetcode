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
def rotate_right(head, k)
    return head if k.zero? || head.nil?

    len = 0
    tail = nil
    node = head
    until node.nil?
        len += 1
        tail = node
        node = node.next
    end

    return head if len == 1
    return head if (mod = k%len).zero?

    rotate_position = len-1 - mod
    node = head
    while rotate_position > 0
        node = node.next
        rotate_position -= 1
    end

    rotate = node.next
    node.next = nil
    tail.next = head

    rotate
end
