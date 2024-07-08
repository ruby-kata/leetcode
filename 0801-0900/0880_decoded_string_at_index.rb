# @param {String} s
# @param {Integer} k
# @return {String}
def decode_at_index(s, k)
    stack = []
    len = 0
    s.each_char do |c|
        if c.to_i == 0
            len += 1
            return c if len == k
            stack.push(c)
        else
            stack.push(len)
            len *= c.to_i
        end
        break if len >= k
    end

    len = stack.pop
    k = k % len == 0 ? 0 : len - (k % len)
    while k > 0
        c = stack.pop
        if c.to_i == 0
            k -= 1
        else
            k %= c.to_i
        end
    end

    stack.pop until stack.last.to_i == 0
    stack.pop
end
