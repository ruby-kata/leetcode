# @param {String} s
# @return {String}
def shortest_palindrome(s)
    return "" if s.empty?
    
    s_reverse = s.reverse
    (0...s_reverse.length).each { |i|
        if s_reverse[i..] == s[..s.length-1-i]
            return s_reverse[0...i] + s
        end
    }
end
