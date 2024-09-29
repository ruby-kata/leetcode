class AllOne
    LLNode = Struct.new(:prev, :next, :val, :keys, :key) do
        def append(key)
            node = LLNode.new(nil, nil, val + 1, {})
            node.prev = self
            node.next = self.next
            self.next&.prev = node
            self.next = node
            
            node.keys[key] = true
            node.key = key
            node
        end

        def prepend(key)
            node = LLNode.new(nil, nil, val - 1, {})
            node.next = self
            node.prev = self.prev
            self.prev&.next = node
            self.prev = node
            
            node.keys[key] = true
            node.key = key
            node
        end

        def delete_key(key)
            self.keys.delete(key)
            self.key = self.keys.keys.first if self.key = key
        end

        def remove
            self.prev&.next = self.next
            self.next&.prev = self.prev
        end
    end

    def initialize()
        @head = LLNode.new(nil, nil, 0, {}, nil)
        @head.next = @head
        @head.prev = @head
        @key_to_node = Hash.new
    end

    def inc(key)
        if @key_to_node.has_key?(key)
            old_node = @key_to_node[key]
            if old_node.next == @head || old_node.next.val > old_node.val + 1
                @key_to_node[key] = old_node.append(key)
            else
                old_node.next.keys[key] = true
                @key_to_node[key] = old_node.next
            end
            old_node.delete_key(key)
            if old_node.keys.empty?
                old_node.remove
            end
        else
            if @head.next == @head || @head.next.val > 1
                @key_to_node[key] = @head.append(key)
            else
                @head.next.keys[key] = true
                @key_to_node[key] = @head.next
            end
        end
    end

    def dec(key)
        if @key_to_node.has_key?(key)
            old_node = @key_to_node[key]
            if old_node.val == 1
                @key_to_node.delete(key)
            else
                if old_node.prev == @head || old_node.prev.val < old_node.val - 1
                    @key_to_node[key] = old_node.prepend(key)
                else
                    old_node.prev.keys[key] = true
                    @key_to_node[key] = old_node.prev
                end
            end
            old_node.delete_key(key)
            if old_node.keys.empty?
                old_node.remove
            end
        end
    end

    def get_max_key()
       @head.prev.key || ""
    end

    def get_min_key()
        @head.next.key || ""
    end
end
