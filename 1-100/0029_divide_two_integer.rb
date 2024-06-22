MAX = 2**31 - 1
MIN = -(MAX + 1)

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
    negative = (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)
    sum = 0
    quotient = 0
    dividend = dividend.abs
    divisor = divisor.abs
    31.downto(0) do |i|
        part = divisor << i
        next if sum + part > dividend
        sum += part
        quotient |= (1 << i)
    end

    negative ? [-quotient, MIN].max : [quotient, MAX].min
end

# other way
def divide(dividend, divisor)
    return 0 if dividend == 0
    if divisor == 1
       return MAX if dividend < MIN or dividend > MAX
       return dividend  
    end
    if divisor == -1
       return MAX if -dividend < MIN or -dividend > MAX
       return -dividend
    end
    negative = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0) 
    dividend_abs = dividend.abs
    divisor_abs = divisor.abs 
    quotient = 0
    sum = 0
    until sum >= dividend_abs && sum < dividend_abs + divisor_abs
     quotient_extend = 1
     sum_extend = divisor_abs
     prev_quotient = 0
     prev_sum = 0
     until sum >= dividend_abs
         prev_sum = sum
         sum += sum_extend
         prev_quotient = quotient
         quotient += quotient_extend
         sum_extend += sum_extend
         quotient_extend += quotient_extend
     end
     if sum >= dividend_abs + divisor_abs
         sum = prev_sum
         quotient = prev_quotient
     end
    end
    if sum > dividend_abs
     quotient -= 1
    end
    quotient = -quotient if negative
    return MAX if quotient > MAX || quotient < MIN
    quotient
end
