TrieNode = Struct.new(:chars) do
    def build(str)
        node = self
        str.each_char do |c|
            node.chars[c.ord] ||= TrieNode.new([])
            node = node.chars[c.ord]
        end
        self
    end

    def common_prefix_len(str)
        l = 0
        node = self
        str.each_char do |c|
            break if node.chars[c.ord].nil?
            l += 1
            node = node.chars[c.ord]
        end
        l
    end
end

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    first = strs.shift()
    return first if strs.empty?
    
    trie = TrieNode.new([]).build(first)
    common_longest = first.size
    strs.each do |str|
        cpl = trie.common_prefix_len(str)
        common_longest = cpl if cpl < common_longest
    end

    first[0...common_longest]
end
