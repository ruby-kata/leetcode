# counting sorted nums
def minimum_operations(nums)
    # dp[i]: max len of sorted(non-decreasing) nums[0..current_index]
    # with the num at current index is i-1
    dp = Array.new(3, 0)
    nums.each { |num|
        dp[num-1] += 1
        # len of previous sorted nums which all nums are <= 2
        # is the maximum between:
        #   - len of sorted nums all 1..1
        #   - len of sorted nums all 1..2..2
        dp[1] = [dp[0], dp[1]].max
        # len of previous sorted nums which all are <= 3
        # is the maximum between:
        #   - len of sorted nums all 1..2..2
        #   - len of sorted nums all 1.2.3.3
        dp[2] = [dp[1], dp[2]].max
    }

    # minimum number of removed nums = nums size - max len of sorted sub nums
    nums.size - dp[2]
end

# counting removing nums
def minimum_operations(nums)
    # counter[curr][x] as number of num need to remove from index 0 to current index
    # in order to nums sorted with last num is x
    # ex: counter[curr][0] is the number of num need to remove to make nums sorted like 11...1
    # ex: counter[curr][1] is the number of num need to remove to make nums sorted like 11..2 or 22...
    # ex: counter[curr][2] is the number of num need to remove to make nums sorted 11..22..3 or 33...
    curr = 0
    counter = Array.new(2) { Array.new(3, 0) }
    nums.each { |num|
        curr = 1 - curr
        if num == 1
            # only way to keep nums sorted with last num is 1
            # that is all previous nums are 1
            counter[curr][0] = counter[1-curr][0]
            # to keep nums sorted with last num is 2:
            # remove all previous 1,3
            # or keep previous nums sorted with the last num is 2 then remove the current index (because it's 1)
            counter[curr][1] = counter[1-curr][0..1].min + 1
            # to keep nums sorted with current index is 3:
            # remove all previous 1,2
            # or keep previous nums sorted with the last num is 3 then remove the current index (because it's 1)
            counter[curr][2] = counter[1-curr].min + 1
        elsif num == 2
            counter[curr][0] = counter[1-curr][0] + 1
            counter[curr][1] = counter[1-curr][0..1].min
            counter[curr][2] = counter[1-curr].min + 1
        else
            counter[curr][0] = counter[1-curr][0] + 1
            counter[curr][1] = counter[1-curr][0..1].min + 1
            counter[curr][2] = counter[1-curr].min
        end
    }

    counter[curr].min
end
