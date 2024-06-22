# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
    return '0' if numerator.zero?
    
    f = []
    sign = (numerator < 0 ? -1 : 1) * (denominator < 0 ? -1 : 1)
    f << '-' if sign < 0

    numerator = numerator.abs
    denominator = denominator.abs

    d = numerator/denominator
    f << d
    numerator = numerator % denominator

    return f.join('') if numerator.zero?

    f << '.'
    r = Hash.new
    repeat = -1
    i = f.size
    until numerator.zero?
        numerator *= 10
        break repeat = r[numerator] if r.has_key?(numerator)

        r[numerator] = i
        i += 1

        f << numerator/denominator
        numerator = numerator % denominator
    end

    if repeat > 0
        f = f[0...repeat] + ['('] + f[repeat..] + [')']
    end

    f.join('')
end
