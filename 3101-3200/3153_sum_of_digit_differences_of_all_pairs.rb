# @param {Integer[]} nums
# @return {Integer}
def sum_digit_differences(nums)
    counter = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = 0 } }
    nums.each { |num|
        num.digits.each_with_index { |d, i|
            counter[i][d] += 1
        }
    }

    counter.reduce(0) { |sum, (i, h)|
        sum += h.values.reduce([0, 0]) { |(acc, sum), v| [acc += (sum * v), sum += v] }.first
    }
end
