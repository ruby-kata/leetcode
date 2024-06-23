# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
    return 0 if root.nil?

    sum = 0
    queue = [root]
    while queue.size > 0
        lo = 0
        hi = queue.size
        while lo < hi
            m = (lo + hi) / 2
            if queue[m].left.nil? && queue[m].right.nil?
                hi = m
            else
                lo = m + 1
            end
        end
        sum += queue.size
        
        next_queue = []
        (0...lo).each { |i| 
            next_queue.push(queue[i].left) unless queue[i].left.nil?
            next_queue.push(queue[i].right) unless queue[i].right.nil?
        }

        queue = next_queue
    end
    
    sum
end
