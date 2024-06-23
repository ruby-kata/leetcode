# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def detectCycle(head)
    slow = fast = head
    while fast && fast.next
        fast = fast.next.next
        slow = slow.next
        if slow == fast
            slow = head
            while slow != fast
                slow = slow.next
                fast = fast.next
            end
            return slow
        end
    end
end
