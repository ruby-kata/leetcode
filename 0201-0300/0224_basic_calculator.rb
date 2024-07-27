# @param {String} s
# @return {Integer}
def calculate(s, i = 0, j = s.length-1)
    sum = 0
    curr = 0
    curr_sign = 1 # 1 for +, -1 for -
    signs_stack = [1]
    while i <= j
        if s[i] >= "0" && s[i] <= "9"
            curr = curr * 10 + s[i].to_i
        elsif s[i] == "+" || s[i] == "-"
            sum += curr_sign * curr
            curr = 0
            # -(-(x)) == +x
            curr_sign = (s[i] == "+" ? 1 : -1) * signs_stack[-1]
        elsif s[i] == "("
            signs_stack.push(curr_sign.dup)
        elsif s[i] == ")"
            signs_stack.pop
        end
        i += 1
    end

    sum += curr_sign * curr
end
