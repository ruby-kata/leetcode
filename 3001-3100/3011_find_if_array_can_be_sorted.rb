# @param {Integer[]} nums
# @return {Boolean}
def can_sort_array(nums)
    count_set_bits = lambda { |num|
        count = 0
        until num.zero?
            num &= (num - 1)
            count += 1
        end
        count
    }

    segments = [[0]]
    prev_count = 0
    nums.each { |num|
        number_of_set_bits = count_set_bits.call(num)
        if prev_count != number_of_set_bits
            segments << [num]
            prev_count = number_of_set_bits
        else
            segments.last << num
        end
    }

    segments.map { |arr| [arr.min, arr.max] }
        .each_cons(2)
        .all? { |prev, curr| prev.last < curr.first }
end

# better
def can_sort_array(nums)
    count_set_bits = lambda { |num|
        count = 0
        until num.zero?
            num &= (num - 1)
            count += 1
        end
        count
    }

    prev_set_bits = 0
    prev_max = -1
    curr_min = 0
    curr_max = 0
    nums.each { |num|
        number_of_set_bits = count_set_bits.call(num)
        if prev_set_bits != number_of_set_bits
            return false if prev_max > curr_min

            prev_max = curr_max
            curr_min = curr_max = num
            prev_set_bits = number_of_set_bits
        else
            curr_min = num if curr_min > num
            curr_max = num if curr_max < num
        end
    }
    
    prev_max <= curr_min
end
