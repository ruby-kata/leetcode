# @param {Integer[]} rating
# @return {Integer}
def num_teams(rating)
    max = rating.max
    count = 0

    # for each k, there're teams formed by rating[k], previous rating[j] <= rating[k] - 1, and previous ratings[i] < rating[j]
    # ........ rating[k]-1 rating[k]
    #    [i]         j        k
    counter = BinaryIndexedTree.new(max)
    accumulate = BinaryIndexedTree.new(max)
    (0...rating.size).each { |k|
        rate = rating[k]
        count += accumulate.range_sum(rate-1)
        accumulate.update(rate, counter.range_sum(rate-1))
        counter.update(rate, 1)
    }

    # same as above, but in reverse direction
    counter = BinaryIndexedTree.new(max)
    accumulate = BinaryIndexedTree.new(max)
    (rating.size-1).downto(0) { |k|
        rate = rating[k]
        count += accumulate.range_sum(rate-1)
        accumulate.update(rate, counter.range_sum(rate-1))
        counter.update(rate, 1)
    }

    count
end

class BinaryIndexedTree
    attr_reader :counter

    def initialize(size)
        @size = size
        @counter = Array.new(size+1, 0)
    end

    def update(index, val)
        i = index + 1
        while i <= @size
            @counter[i] += val
            i += i & (-i)
        end
    end

    def range_sum(index)
        sum = 0 
        i = index + 1
        while i > 0
            sum += @counter[i]
            i -= i & (-i)
        end
        sum
    end
end
