# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def connect(root)
    curr_level = root
    until curr_level.nil?
        next_level_start = next_level = Node.new
        until curr_level.nil?
            if curr_level.left
                next_level.next = curr_level.left
                next_level = next_level.next
            end

            if curr_level.right
                next_level.next = curr_level.right
                next_level = next_level.next
            end
            curr_level = curr_level.next
        end
        curr_level = next_level_start.next
    end

    root
end
