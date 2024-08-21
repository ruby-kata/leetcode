# @param {Integer} n
# @return {Integer}
def alternate_digit_sum(n)
    sum = 0
    sign = 1
    power = 10
    while n > 0
        sum += sign * (n % power)
        n /= power
        sign *= -1
    end

    -sign * sum
end

def alternate_digit_sum(n)
    n.digits.reverse.reduce([0, 1]) { |(sum, sign), digit| [sum += sign * digit, sign *= -1] }.first
end
