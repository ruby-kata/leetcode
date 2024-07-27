# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Integer[]}
def count_of_peaks(nums, queries)
    peak = Array.new(nums.size, false)
    bit = BinaryIndexedTree.new(nums.size)
    (1...nums.size-1).each { |i|
        if nums[i] > nums[i-1] && nums[i] > nums[i+1]
            bit.update(i, 1)
            peak[i] = true
        end
    }

    result = []
    queries.each { |q| 
        if q[0] == 1
            result << (q[1] < q[2] ? (bit.range_sum(q[2]-1) - bit.range_sum(q[1])) : 0)
        elsif q[0] == 2
            i, val = q[1], q[2]
            nums[i] = val

            l = [i-1, 1].max
            r = [i+1, nums.size-2].min
            (l..r).each { |j|
                if nums[j] > nums[j-1] && nums[j] > nums[j+1]
                    bit.update(j, 1) unless peak[j]
                    peak[j] = true
                else
                    bit.update(j, -1) if peak[j]
                    peak[j] = false
                end
            }
        end
    }

    result
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
