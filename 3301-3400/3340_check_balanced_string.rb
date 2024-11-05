# @param {String} num
# @return {Boolean}
def is_balanced(num)
    num.chars.each_slice(2).reduce([0, 0]) { |sum, (a, b)|
        sum[0] += a.to_i
        sum[1] -= b.to_i
        sum
    }.sum.zero?
end
