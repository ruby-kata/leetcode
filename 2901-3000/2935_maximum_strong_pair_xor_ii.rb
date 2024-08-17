# @param {Integer[]} nums
# @return {Integer}
def maximum_strong_pair_xor(nums)
    nums.sort!

    # 1 <= nums[i] <= 2**20 - 1
    trie = Trie.new(20)
    max_xor = 0
    i = j = 0
    while i < nums.size
        trie.insert(nums[i])
        # maintain sliding window |x - y| <= min(x, y)
        while 2*nums[j] < nums[i]
            trie.delete(nums[j])
            j += 1
        end

        max_xor = [max_xor, trie.find_max_xor_with(nums[i])].max
        i += 1
    end

    max_xor
end

class Trie
    class Node
        attr_accessor :bit, :count, :children
        def initialize(bit, count)
            @bit = bit
            @count = count
            @children = []
        end
    end

    def initialize(max_height)
        @max_height = max_height
        @root = Node.new(0, 0)
    end

    def insert(num)
        node = @root
        i = @max_height
        while i >= 0
            bit = ((num >> i) & 1)
            node.children[bit] ||= Node.new(bit, 0)
            node.children[bit].count += 1
            node = node.children[bit]
            i -= 1
        end
    end

    def delete(num)
        node = @root
        i = @max_height
        while i >= 0
            bit = ((num >> i) & 1)
            node.children[bit].count -= 1
            node = node.children[bit]
            i -= 1
        end
    end

    def find_max_xor_with(num)
        max_xor = 0
        node = @root
        i = @max_height
        while i >= 0
            bit = ((num >> i) & 1)
            # because we're finding the max xor, so we always find the bit-set 1 first
            # the bit that xor with bit equals 1
            _bit = bit ^ 1
            if node.children[_bit] && node.children[_bit].count > 0
                max_xor |= (1 << i)
                node = node.children[_bit]
            else
                node = node.children[bit]
            end
            i -= 1
        end

        max_xor
    end
end
