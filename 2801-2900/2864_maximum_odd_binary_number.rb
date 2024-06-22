# @param {String} s
# @return {String}
def maximum_odd_binary_number(s)
    ones = s.chars.count('1')
    '1' * (ones-1) + '0' * (s.size-ones) + '1'
end
