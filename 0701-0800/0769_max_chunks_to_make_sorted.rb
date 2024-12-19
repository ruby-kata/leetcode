# @param {Integer[]} arr
# @return {Integer}
def max_chunks_to_sorted(arr)
    stack = [[-1,-1]]
    arr.each { |num|
        min, max = num, [num, stack[-1][-1]].max
        while stack[-1][-1] > num
            l, r = stack.pop
            next if num < l

            min = l
            break
        end

        stack.push([min, max])
    }

    stack.size - 1
end

# optimize
def max_chunks_to_sorted(arr)
    max = -1
    arr.each_with_index.count { |num, i|
        # since arr is a permutation of numbers in [0, n-1]
        # so if the current max equal to the index
        # that mean all numbers on the left will < the current, 
        # and the rest will > the current
        # that mean there's at least 1 more split
        (max = [max, num].max) == i
    }
end
