class CircularList
    class Node
        attr_accessor :val, :next
        def initialize(val, next_node = nil)
            @val = val
            @next = next_node
        end
    end

    attr_reader :head, :tail
    def initialize(n)
        @head = CircularList::Node.new(1)
        curr = @head
        (2..n).each do |i|
            curr.next = CircularList::Node.new(i)
            curr = curr.next
        end
        curr.next = @head
        @tail = curr
    end

    def remove_each_k(k, curr: @head, prev: @tail)
        count = k
        while count > 1
            prev = curr
            curr = curr.next
            count -= 1
        end

        return prev if prev === curr.next
        
        prev.next = curr.next
        remove_each_k(k, curr: curr.next, prev: prev)
    end
end

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_the_winner(n, k)
    cl = CircularList.new(n)
    cl.remove_each_k(k).val
end
