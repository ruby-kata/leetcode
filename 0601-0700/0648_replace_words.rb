class Trie
    Node = Struct.new(:char, :children, :is_word) do
        def find_or_create_child(c)
            if !children.has_key?(c)
                children[c] = Node.new(c, {}, false)
            end
            children[c]
        end
    end

    def initialize
        @root = Node.new('', {}, false)
    end

    def insert(word)
        node = @root
        word.each_char do |c|
            node = node.find_or_create_child(c)
        end
        node.is_word = true
    end

    def find_shortest_word(str_path)
        node = @root
        (0...str_path.length).each do |i|
            node = node.find_or_create_child(str_path[i])
            return str_path[0..i] if node.is_word
        end
        str_path
    end
end

# @param {String[]} dictionary
# @param {String} sentence
# @return {String}
def replace_words(dictionary, sentence)
    trie = Trie.new
    dictionary.each do |word|
        trie.insert(word)
    end

    sentence.split(' ').map do |word|
        trie.find_shortest_word(word)
    end.join(' ')
end
