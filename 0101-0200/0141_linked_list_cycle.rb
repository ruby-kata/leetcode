# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    fast = head
    slow = head
    while fast
        fast = fast.next&.next
        slow = slow.next
        return true if fast && fast == slow
    end

    false
end
