# @param {Integer[]} arr
# @return {Boolean}
def can_three_parts_equal_sum(arr)
    sum = arr.sum
    return false if sum % 3 != 0

    a_third = sum / 3
    sub_sum = 0
    parts = 0
    (0...arr.length).each do |i|
        sub_sum += arr[i]
        if sub_sum == a_third
            parts += 1
            sub_sum = 0
        end
        return i < arr.length - 1 if parts == 2
    end

    false
end
