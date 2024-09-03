# @param {String} s
# @param {Integer} k
# @return {Integer}
def get_lucky(s, k)
    num = s.chars.map { |c| c.ord - 96 }.join.to_i
    k.times do
        num = num.digits.sum
    end
    num
end
