# @param {Integer[]} nums
# @param {Integer} n
# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_sum(nums, n, left, right)
    sums = []
    (0...nums.size).each { |i|
        sum = 0
        (i...nums.size).each { |j|
            sum += nums[j]
            sums << sum
        }
    }

    sums.sort!

    mod = 1000000007
    sum = 0
    (left-1..right-1).each { |i|
        sum = (sum + sums[i])  % mod
    }

    sum
end


# binary-search approach
# O(nlogn)
def range_sum(nums, n, left, right)
    # count on sum-array which computed the sum of all non-empty continuous subarrays from the array
    count_sub_arrays_have_sum_less_than_or_equal = lambda { |max_sum|
        count = 0
        total_sum = 0 # sum of all sum of sub-arrays <= max_sum
        window_sum = 0 # maintain the window [i..j] that has sum <= max_sum
        total_window_sum = 0 # sum of all sum of sub-arrays (in window) <= max_sum
        i = j = 0
        while j < nums.size
            # for each new j
            # ..i.....[j]
            #   [    ] <----- all of them is counted into total_window_sum at previous j
            #    [   ] <----- now with new j, we can calculate total_window_sum
            #     [  ] <----- by adding nums[j] for each of them 
            #      ... <-----
            total_window_sum += nums[j] * (j-i+1)
            # extend window
            window_sum += nums[j]
            # adjust windown [i..j] so the sum <= max_sum by shift-right i
            while window_sum > max_sum
                # each time we shift-right i by 1
                # ...i......j
                #    x[     ] <--- remove i+1
                #     x[    ] <--- remove i+2
                #      x[   ] <--- remove i+3
                #       ..... <--- and so on ... so we end up removing window_sum 
                total_window_sum -= window_sum
                window_sum -= nums[i]
                i += 1
            end

            total_sum += total_window_sum
            count += j-i+1 # for each window [i..j], we have j-i+1 sub-arrays
            j += 1
        end

        [count, total_sum]
    }

    min = nums.min
    max = nums.sum

    # suppose sum-array is sorted, all values will be in range [min..max]
    # we can find sum-array[i] by binary-searching in [min..max] which max-value that
    # the number of {sum-sub-array <= value} is >= i + 1
    # ......value......
    # ......i
    #[i+1 sum]
    #
    # sum of sum-array[0..index]
    find_sum_to_index = lambda { |index| # 0-indexed
        low = min
        high = max

        while low < high
            m = (low + high)/2
            count, sum = count_sub_arrays_have_sum_less_than_or_equal.call(m)
            if  count < index + 1
                low = m + 1
            else
                high = m
            end
        end

        # now low is the max-value we need to find
        # since we count all sums that <= low, so there're some dup lows
        # we need to cut them
        # .....low low low ....
        # .....index....count
        # [     ]--------- 
        count, sum = count_sub_arrays_have_sum_less_than_or_equal.call(low)
        sum - low * (count - index - 1)
    }

    # 0-indexed
    # .... left-2 .... right-1 ....
    # [       ]
    # [       |-----------]
    (find_sum_to_index.call(right-1) - find_sum_to_index.call(left-2)) % 1000000007
end
