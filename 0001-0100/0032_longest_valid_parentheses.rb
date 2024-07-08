# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
    longest = Array.new(s.size+1) { 0 }
    max = 0
    (s.size-2).downto(0) do |i|
        if s[i] == "(" and s[i + longest[i+1] + 1] == ")"
            longest[i] = longest[i+1] + 2
            longest[i] += longest[i + longest[i]]
            max = longest[i] if max < longest[i]
        end
    end
    max
end
