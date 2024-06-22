# @param {String} s
# @return {String}
def clear_digits(s)
    stack = []
    s.each_char do |c|
        if c >= '0' && c <= '9'
            stack.pop
        else
            stack.push(c)
        end
    end

    stack.join
end
