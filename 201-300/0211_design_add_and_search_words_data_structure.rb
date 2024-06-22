class WordDictionary

    TrieNode = Struct.new(:is_word, :children)

    def initialize()
        @root = TrieNode.new(false, Array.new(26))
        @cache = Hash.new
    end

=begin
    :type word: String
    :rtype: Void
=end
    def add_word(word)
        node = @root
        word.each_char do |c|
            c_index = c.ord - 97
            node.children[c_index] ||= TrieNode.new(false, Array.new(26)) 
            node = node.children[c_index]
        end
        node.is_word = true

        @cache.clear
    end


=begin
    :type word: String
    :rtype: Boolean
=end
    def search(word, char_index = 0, node = @root)
        return @cache[word] unless @cache[word].nil?

        return false if node.nil?
        return node.is_word if char_index == word.length

        c = word[char_index]
        found = false
        if c == "."
            for i in 0...26 do
                if search(word, char_index + 1, node.children[i])
                    found = true
                    break
                end
            end
        else
            child_node = node.children[c.ord - 97]
            found = child_node.nil? ? false : search(word, char_index + 1, child_node) 
        end

        @cache[word] = found if char_index == 0
        return found
    end
    
end
