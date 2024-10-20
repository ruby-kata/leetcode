# @param {String} expression
# @return {Boolean}
def parse_bool_expr(expression)
    parse = lambda { |expression, index|
        if expression[index] == 't'
            return true, index + 1
        elsif expression[index] == 'f'
            return false, index + 1
        elsif expression[index] == '!'
            bool, next_index = parse.call(expression, index + 2)
            return !(bool), next_index + 1
        else
            result = is_and = expression[index] == '&'
            next_index = index + 2
            while expression[next_index] != ')'
                sub_result, next_index = parse.call(expression, next_index)
                result = is_and ? (result & sub_result) : (result | sub_result)
                next_index += 1 if expression[next_index] == ","
            end
            return result, next_index + 1
        end
    }

    parse.call(expression, 0).first
end
