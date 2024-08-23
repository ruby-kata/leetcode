# @param {String} expression
# @return {String}
def fraction_addition(expression)
    fractions = []
    fractions << [0] if expression[0] != '+' && expression[0] != '-'
    sign = 1
    expression.chars.each { |c|
        if c == '+' || c == '-'
            sign = c == '+' ? 1 : -1
            fractions << [0]
        elsif c == '/'
            sign = 1
            fractions.last << 0
        else
            f = fractions.last
            f[-1] = (f[-1] * 10) + sign * (c.to_i)
        end
    }

    result = fractions.reduce([0, 1]) { |r, (numerator, denominator)|
        r = [r.first * denominator + numerator * r.last, r.last * denominator]
        r
    }

    gcd = [result.first.gcd(result.last), 1].max
    result.map { |r| r/gcd }.join('/')
end
