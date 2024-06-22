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
def double_it(head)
    stack = []
    until head.nil?
        stack.push(head)
        head = head.next
    end

    rem = 0
    until stack.empty?
        head = stack.pop
        head.val = head.val * 2 + rem
        rem = head.val/10
        head.val %= 10
    end

    head = ListNode.new(rem, head) if rem > 0

    head
end
