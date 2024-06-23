class Trie
    Node = Struct.new(:char, :children, :is_word) do
        def find(word)
            node = self
            word.each_char do |c|
                node = node.children[c]
                return nil if node.nil?
            end
            node
        end

        def findOrCreateChild(c)
            if children[c].nil?
                children[c] = Node.new(c, {}, false)
            end
            children[c]
        end
    end

    def initialize()
        @root = Node.new(".", {}, false)        
    end

    def insert(word)
        node = @root
        word.each_char do |c|
            node = node.findOrCreateChild(c)
        end
        node.is_word = true
    end

    def search(word)
        node = @root.find(word)
        !node.nil? && node.is_word
    end

    def starts_with(prefix)
        node = @root.find(prefix)
        !node.nil?
    end
end
