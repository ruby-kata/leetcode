# @param {String} s
# @param {Character} letter
# @return {Integer}
def percentage_letter(s, letter)
    s.chars.count { |c| c == letter } * 100 / s.size
end
