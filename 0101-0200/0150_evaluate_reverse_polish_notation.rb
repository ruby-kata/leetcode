# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
    stack = []
    tokens.each do |x|
        case x
        when "+", "-", "*"
            b = stack.pop
            a = stack.pop
            stack.push(a.send(x, b))
        when "/"
            b = stack.pop
            a = stack.pop
            sign = (a >= 0 ? 1 : -1) * (b >= 0 ? 1 : -1)
            result = a.abs.send(x, b.abs) * sign
            stack.push(result)
        else
            stack.push(x.to_i)
        end
    end

    stack.pop
end
