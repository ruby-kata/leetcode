# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {Integer} a
# @param {Integer} b
# @param {ListNode} list2
# @return {ListNode}
def merge_in_between(list1, a, b, list2)
    i = 0
    a_node = list1
    a_node = a_node.next until (i += 1) == a
    
    b_node = a_node.next
    b_node = b_node.next until (i += 1) == b + 1

    a_node.next = list2
    list2 = list2.next until list2.next == nil
    list2.next = b_node.next

    list1
end
