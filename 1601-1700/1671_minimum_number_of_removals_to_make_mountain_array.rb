# @param {Integer[]} nums
# @return {Integer}
def minimum_mountain_removals(nums)
    lis = lambda { |arr|
        counter = []
        increase_arr = []
        arr.each { |num|
            if increase_arr.empty? || num > increase_arr.last
                increase_arr << num
            elsif num < increase_arr.last
                i = increase_arr.bsearch_index { |x| x >= num }
                increase_arr[i] = num
            end
            counter << increase_arr.size
        }
        counter
    }

    l = lis.call(nums)
    r = lis.call(nums.reverse)
    
    longest = 0
    (0...nums.length).each { |i|
        if l[i] > 1 && r[nums.length - 1 - i] > 1
            longest = [longest, l[i] + r[nums.length - 1 - i] - 1].max
        end
    }

    nums.size - longest
end
