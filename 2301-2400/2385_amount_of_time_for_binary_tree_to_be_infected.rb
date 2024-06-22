# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} start
# @return {Integer}
def amount_of_time(root, start)
    def build_graph(graph, node, parent = nil)
        return if node.nil?

        graph[node.val] = {adj: [parent, node.left, node.right], seen: false}
        build_graph(graph, node.left, node)
        build_graph(graph, node.right, node)
    end
    
    build_graph(graph = {}, root)

    queue = [start]
    time = 0
    until queue.empty?
        queue.size.times do
            node_val = queue.shift
            graph[node_val][:seen] = true
            graph[node_val][:adj].each do |node|
                queue.push(node.val) if node && !graph[node.val][:seen]
            end
        end
        time += 1 unless queue.empty?
    end

    time
end
