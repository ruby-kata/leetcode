# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {Integer[]} nums
# @param {ListNode} head
# @return {ListNode}
def modified_list(nums, head)
    nums_hash = {}
    nums.each { |num| nums_hash[num] = true }

    head = head.next while nums_hash.has_key?(head.val)

    prev_node = head
    node = head.next
    until node.nil?
        unless nums_hash.has_key?(node.val)
            prev_node.next = node
            prev_node = node
        end
        node = node.next 
    end
    prev_node.next = node

    head
end
