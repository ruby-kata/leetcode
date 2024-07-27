# @param {Integer} n
# @return {Integer[]}
def lexical_order(n)
    trie = Trie.new
    (1..n).each { |num| trie.add(num) }
    trie.lexicographical
end

class Trie
    class Node
        attr_accessor :children, :num

        def initialize
            @children = Array.new(10)
            @num = nil
        end
    end

    def initialize
        @root = Node.new
    end

    def add(num)
        node = @root
        digits = num.digits.reverse
        until digits.empty?
            d = digits.shift
            node.children[d] = Node.new if node.children[d].nil?
            node = node.children[d]
        end
        node.num = num
    end

    def lexicographical(node = @root)
        nums = []
        return nums if node.nil?

        nums << node.num if node.num

        (0..9).each { |i|
            nums += lexicographical(node.children[i])
        }

        nums
    end
end
