# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
#
def add_two_numbers(l1, l2)
    root = ListNode.new
    l = root; rem = 0

    until l1.nil? && l2.nil? && rem.zero?
        sum = (l1&.val || 0) + (l2&.val || 0) + rem
        l = l.next = ListNode.new sum % 10
        rem = sum >= 10 ? 1 : 0
        l1 = l1&.next; l2 = l2&.next
    end

    root.next
end