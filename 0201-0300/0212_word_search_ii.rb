class TrieNode
    attr_accessor :word
    attr_reader :char
    attr_reader :children
    def initialize(c = nil)
        @char = c
        @children = Hash.new
    end

    def add(word)
        node = self
        word.each_char do |c|
            if node.children[c].nil?
                node.children[c] = TrieNode.new(c)
            end
            node = node.children[c]
        end
        node.word = word
    end
end

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
    rs = board.size
    cs = board[0].size
    trie = TrieNode.new
    (0...rs).each do |r|
        (0...cs).each do |c|
            trie.children[board[r][c]] = TrieNode.new(board[r][c])
        end
    end

    words.each do |word|
        trie.add(word) unless trie.children[word[0]].nil?
    end

    directions = [[1,0],[-1,0],[0,1],[0,-1]]
    found_words = []

    backtrack = -> (r, c, node) {
        return if board[r][c] == ""
        return if (next_node = node.children[board[r][c]]).nil?
        unless next_node.word.nil?
            found_words.push(next_node.word)
            next_node.word = nil
        end

        temp = board[r][c]
        board[r][c] = ""
        directions.each do |(i, j)|
            _r = r + i
            _c = c + j
            if _r >= 0 && _r < rs && _c >= 0 && _c < cs
                backtrack.call(_r, _c, next_node)
            end
        end
        board[r][c] = temp

        if next_node.word.nil? && next_node.children.empty?
            node.children[next_node.char] = nil
        end
    }

    (0...rs).each do |r|
        (0...cs).each do |c|
            backtrack.call(r, c, trie)
        end
    end

    found_words
end
