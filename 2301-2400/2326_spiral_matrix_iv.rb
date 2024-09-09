# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {Integer} m
# @param {Integer} n
# @param {ListNode} head
# @return {Integer[][]}
def spiral_matrix(m, n, head)
    matrix = Array.new(m) { Array.new(n, -1) }
    round = 0
    p = head
    until p.nil?
        # top left -> right
        (round..n-round-1).each { |i|
            break if p.nil?
            matrix[round][i] = p.val
            p = p.next
        }
        # top right -> bot
        (round+1..m-round-1).each { |i|
            break if p.nil?
            matrix[i][n-round-1] = p.val
            p = p.next
        }
        # bot right -> left
        (round+1..n-round-1).each { |i|
            break if p.nil?
            matrix[m-round-1][n-1-i] = p.val
            p = p.next
        }
        # bot left -> top
        (round+1..m-round-2).each { |i|
            break if p.nil?
            matrix[m-1-i][round] = p.val
            p = p.next
        }

        round += 1
    end

    matrix
end
