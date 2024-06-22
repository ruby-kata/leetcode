class UnionFind
    def initialize(size)
        @uset = (0...size).to_a
    end

    def find(x)
        @uset[x] = find(@uset[x]) if x != @uset[x]
        @uset[x]
    end

    def union(x, y)
        _x = find(x)
        _y = find(y)

        @uset[_y] = _x
    end
end

# @param {Integer[]} nums
# @return {Boolean}
def can_traverse_all_pairs(nums)
    num_max = nums.max
    sieve = (0..num_max).to_a
    (2..Math.sqrt(num_max)).each do |x|
        next if sieve[x] != x

        y = x + x
        until y > num_max
            sieve[y] = [sieve[y], x].min
            y += x
        end
    end

    uf = UnionFind.new(nums.size)
    prime_to_index = {}
    visited = {}
    (0...nums.size).each do |i|
        if visited.has_key?(nums[i])
            uf.union(visited[nums[i]], i)
            next
        end

        prime_factors = []
        num = nums[i]
        while num > 1
            divisor = sieve[num]
            prime_factors << divisor
            num /= divisor until num % divisor != 0
        end

        prime_factors.each do |prime|
            if prime_to_index.has_key?(prime)
                visited[nums[i]] = uf.union(prime_to_index[prime], i)
            else
                prime_to_index[prime] = i
            end
        end
    end

    root = uf.find(0)
    (1...nums.size).all? { |i| uf.find(i) == root }
end
