# @param {Integer} start
# @param {Integer} goal
# @return {Integer}
def min_bit_flips(start, goal)
    count = 0
    while start > 0 || goal > 0
        count += 1 if (start & 1) != (goal & 1)
        start >>= 1
        goal >>= 1
    end

    count
end

def min_bit_flips(start, goal)
    count_set_bits = lambda { |n|
        count = 0
        until n.zero?
            n &= (n-1)
            count += 1
        end
        count
    }

    count_set_bits.call(start ^ goal)
end
