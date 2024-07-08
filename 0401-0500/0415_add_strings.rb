# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
    num1_arr = num1.chars
    num2_arr = num2.chars

    sum = []
    rem = 0

    until num1_arr.empty? && num2_arr.empty?
        s = num1_arr.pop.to_i + num2_arr.pop.to_i + rem
        sum.unshift(s % 10)
        rem = s/10
    end

    sum.unshift(rem) if rem > 0

    sum.join("")
end
