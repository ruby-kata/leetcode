# @param {String} equation
# @return {String}
def solve_equation(equation)
    # summary: ax + b
    count_x = lambda { |str|
        a = 0
        b = 0
        num = nil
        sign = 1
        str.each_char { |c|
            if c == 'x'
                a += sign * (num || 1)
                num = 0
            elsif c == '+'
                b += sign * num.to_i
                num = nil
                sign = 1
            elsif c == '-'
                b += sign * num.to_i
                num = nil
                sign = -1
            else
                num = (num || 0) * 10 + c.to_i
            end
        }
        b += sign * num.to_i

        return [a, b]
    }

    left, right = equation.split('=')
    al, bl = count_x.call(left)
    ar, br = count_x.call(right)

    a = al - ar
    b = br - bl

    if a == 0
        b == 0 ? "Infinite solutions" : "No solution"
    elsif b % a != 0
        "No solution"
    else 
        "x=#{b/a}"
    end
end
