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
# @return {ListNode[]}
def split_list_to_parts(head, k)
    len = 0
    p = head
    while p
        len += 1
        p = p.next
    end

    parts = Array.new(k)
    parts_len = Array.new(k, 0)
    while len > 0
        (0...k).each do |i|
            break if len <= 0
            parts_len[i] += 1
            len -= 1
        end
    end

    p = head
    parts_len.each_with_index do |l, i|
        break if p.nil? || l <= 0
        parts[i] = p

        (l-1).times { |_| p = p.next }
        next_p = p.next
        p.next = nil
        p = next_p
    end

    parts
end
