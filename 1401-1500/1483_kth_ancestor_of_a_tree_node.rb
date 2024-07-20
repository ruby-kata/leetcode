class TreeAncestor
    def initialize(n, parent)
        # the max-height of the Binary-Lifting
        # or the max-len of the bit representation of n count from the left-most significant
        # ex: 156: "10011100" => 8
        @max_height = Math.log(n, 2).ceil

        @dp = Hash.new { |ancestor, node| ancestor[node] = Hash.new }

        (0...n).each do |node|
            @dp[node][0] = parent[node] # lift node(2^0=1) == this node's parent
        end

        (1..@max_height).each do |h|
            (0...n).each do |node|
                # the lift_node(2^h) = the lift_node(2^(h-1)) (if existed) lift up h-1
                @dp[node][h] = @dp[node][h-1] == -1 ? -1 : (@dp[@dp[node][h-1]][h-1] || -1)
            end
        end
    end
    
    def get_kth_ancestor(node, k)
        (0..@max_height).each do |i|
            # only lift if the bit is 1
            # ex: 156: "10011100" => will only lift at indexes: 2,3,4, and 7
            node = @dp[node][i] unless (k & (1 << i)).zero?
            break if node == -1
        end
        node
    end
end
    