# BRUTE FORCE

# @param {String[]} words
# @return {String[]}
def string_matching(words)
    result = []
    words.each_with_index do |wi, i|
        words.each_with_index do |wj, j|
            next if i == j || wi.size > wj.size
            
            if wj.include?(wi)
                result << wi
                break
            end
        end 
   end

   result
end


# TRIE

class TrieNode
    attr_reader :children, :count

    def initialize
        @children = Hash.new
        @count = 0
    end

    def increment_count
        @count += 1
    end

    def upsert_child(c)
        (@children[c] ||= TrieNode.new).tap(&:increment_count)
    end
end

class Trie
    attr_reader :root

    def initialize
        @root = TrieNode.new
    end

    def insert(word)
        node = @root
        word.each_char do |c|
            node = node.upsert_child(c)
        end
    end

    def num_of_substrings(word)
        node = @root
        word.each_char do |c|
            node = node.children[c]
            return 0 if node.nil?
        end
        node.count
    end
end

# @param {String[]} words
# @return {String[]}
def string_matching(words)
    trie = Trie.new
    words.each do |word|
        (0...word.size).each do |i|
            trie.insert(word[i..])
        end
    end

    words.select do |word|
        trie.num_of_substrings(word) > 1
    end
end
