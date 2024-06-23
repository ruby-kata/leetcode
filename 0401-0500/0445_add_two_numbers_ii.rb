# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    stack1 = []
    until l1.nil?
        stack1 << l1.val
        l1 = l1.next     
    end
 
    stack2 = [] 
    until l2.nil?
        stack2 << l2.val
        l2 = l2.next
    end
 
    sum = nil
    rem = 0
    while !stack1&.empty? || !stack2&.empty? || rem > 0
        val = rem + (stack1&.pop || 0) + (stack2&.pop || 0)
        rem = val/10
    
        new_node = ListNode.new
        new_node.val = val % 10
        new_node.next = sum
        sum = new_node
    end
 
    sum
end
 