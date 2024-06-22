# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    s.each_char do |c|
        case c
        when ")"
            return false if stack.last != "("
            stack.pop()
        when "]"
            return false if stack.last != "["
            stack.pop()
        when "}"
            return false if stack.last != "{"
            stack.pop()
        else
            stack << c
        end
    end
    stack.empty?
end
