class LRUCache

    class DoubleLLNode
        attr_accessor :key, :val, :prev_node, :next_node

        def initialize(key, val, prev_node, next_node)
            @key = key
            @val = val
            @prev_node = prev_node
            @next_node = next_node
        end
    end

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @capacity = capacity
        @cache = Hash.new
        @keys_head = nil
        @keys_tail = nil
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        return -1 unless @cache.has_key?(key)

        node = @cache[key]
        swap_node_to_head(node)

        node.val
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if @cache.has_key?(key)
            node = @cache[key]
            node.val = value
            swap_node_to_head(node)
        else
            delete_tail if @cache.size >= @capacity
            append_head(key, value)
        end
    end

    private

        def swap_node_to_head(node)
            return if @keys_head == node

            @keys_tail = node.prev_node if @keys_tail == node
            
            node.prev_node.next_node = node.next_node
            node.next_node&.prev_node = node.prev_node
            node.prev_node = nil
            node.next_node = @keys_head
            @keys_head.prev_node = node
            @keys_head = node
        end

        def delete_tail
            delete_node = @keys_tail

            if @keys_tail == @keys_head
                @keys_head = @keys_tail = nil
            else
                @keys_tail = @keys_tail.prev_node
                @keys_tail&.next_node = nil
            end

            @cache.delete(delete_node.key)
        end

        def append_head(key, val)
            if @keys_head.nil?
                @keys_head = DoubleLLNode.new(key, val, nil, nil)
                @keys_tail = @keys_head
            else
                new_head = DoubleLLNode.new(key, val, nil, @keys_head)
                @keys_head.prev_node = new_head
                @keys_head = new_head
            end
            @cache[key] = @keys_head
        end
end
