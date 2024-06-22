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
def remove_nodes(head)
    stack = [] # monotonic stack
    while head
        stack.pop until stack.empty? or stack.last.val >= head.val
        stack.push(head)
        head = head.next
    end

    head = stack.shift
    p = head
    until stack.empty?
        p.next = stack.shift
        p = p.next
    end

    head
end

# recursion
def remove_nodes(head)
    return if head.nil?

    head.next = remove_nodes(head.next)
    (head.next.nil? || head.val >= head.next.val) ? head : head.next
end