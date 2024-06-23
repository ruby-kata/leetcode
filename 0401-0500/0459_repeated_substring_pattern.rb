# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
    divisor = 2
    while divisor <= s.size 
        if s.size % divisor == 0
            quotient = s.size/divisor
            _s = s[0...quotient] * divisor
            return true if s == _s
        end
        divisor += 1
    end
    false
end
