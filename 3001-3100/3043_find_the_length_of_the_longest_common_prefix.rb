# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def longest_common_prefix(arr1, arr2)
    trie_root = TrieNode.new
    arr1.each { |num| trie_root.add(num.digits.reverse) }

    longest = 0
    arr2.each { |num|
        longest = [longest, trie_root.search(num.digits.reverse)].max
    }

    longest
end

class TrieNode
    attr_reader :children

    def initialize
        @children = Array.new(10, nil)
    end

    def add(digits)
        node = self
        digits.each { |d|
            node.children[d] = TrieNode.new if node.children[d].nil?
            node = node.children[d]
        }
    end

    def search(digits)
        len = 0
        node = self
        digits.each { |d|
            break if node.children[d].nil?
            node = node.children[d]
            len += 1
        }

        len
    end
end
