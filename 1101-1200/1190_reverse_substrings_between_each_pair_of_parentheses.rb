# @param {String} s
# @return {String}
def reverse_parentheses(s)
    result = []
    s.each_char { |c|
        if c == ")"
            rev_str = []
            until (rc = result.pop) == "("
                rev_str << rc
            end
            result += rev_str
        else
            result << c
        end
    }

    result.join
end
