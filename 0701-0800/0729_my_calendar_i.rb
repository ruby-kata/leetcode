class MyCalendar
    def initialize()
        @btree = Tree.new
    end

    def book(start_time, end_time)
        @btree.insert(Tree::Node.new(start_time, end_time, nil , nil))
    end
end

class Tree
    Node = Struct.new(:start_time, :end_time, :left, :right)

    def initialize
        @root = Node.new(0, 0, nil, nil)
    end

    def insert(node, parent_node = @root)
        if node.start_time >= parent_node.end_time
            if parent_node.right.nil?
                parent_node.right = node
                return true
            else
                return insert(node, parent_node.right)
            end
        elsif node.end_time <= parent_node.start_time
            if parent_node.left.nil?
                parent_node.left = node
                return true
            else
                return insert(node, parent_node.left)
            end
        else
            return false
        end
    end
end
