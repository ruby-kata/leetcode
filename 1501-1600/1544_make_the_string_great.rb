# @param {String} s
# @return {String}
def make_good(s)
    stack = []
    s.each_char do |c|
        if !stack.empty? && (stack.last.ord - c.ord).abs == 32
            stack.pop
        else
            stack.push(c)
        end
    end

    stack.join('')
end
