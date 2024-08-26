# @param {Integer} num
# @return {Integer}
def maximum69_number(num)
    num.digits.reverse.tap { |digits|
        if i = digits.index(6)
            digits[i] = 9
        end
    }.join.to_i
end

def maximum69_number(num)
    num.to_s.sub('6', '9').to_i
end
