# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @param {TreeNode} root
# @return {Boolean}
def is_sub_path(head, root)
    dfs = lambda { |bt_node, ll_node|
        return true if ll_node.nil?
        return false if bt_node.nil?
        return false if bt_node.val != ll_node.val

        dfs.call(bt_node.left, ll_node.next) || dfs.call(bt_node.right, ll_node.next)
    }

    queue = [root]
    until queue.empty?
        node = queue.shift
        next if node.nil?
        return true if dfs.call(node, head)

        queue.push(node.left, node.right)
    end

    false
end
