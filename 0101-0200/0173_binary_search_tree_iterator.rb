# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
class BSTIterator
    def initialize(root)
        @in_order_nodes = [root.clone]
    end

    def next()
        head = @in_order_nodes[0]
        until head.nil? || head.left.nil?
            head_left = head.left
            head.left = nil
            head = head_left
            @in_order_nodes.unshift(head)
        end

        head = @in_order_nodes.shift
        if head.right
            @in_order_nodes.unshift(head.right)
        end

        head.val
    end


    def has_next()
        !@in_order_nodes.empty?
    end
end
    
# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
