# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer[]}
def nodes_between_critical_points(head)
    min = Float::INFINITY
    max = -1
    first = last = nil
    i = 0
    prev = nil
    curr = head
    while curr
        if prev && curr.next
            if (curr.val > prev.val && curr.val > curr.next.val) || (curr.val < prev.val && curr.val < curr.next.val)
                min = [min, i - last].min if last
                max = i - first if first

                first = i if first.nil?
                last = i
            end
        end

        prev = curr
        curr = curr.next
        i += 1
    end

    [min == Float::INFINITY ? -1 : min, max]
end
