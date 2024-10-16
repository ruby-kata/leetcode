# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {String}
def longest_diverse_string(a, b, c, char_a = 'a', char_b = 'b', char_c ='c')
    return longest_diverse_string(b, a, c, char_b, char_a, char_c) if a < b
    return longest_diverse_string(a, c, b, char_a, char_c, char_b) if b < c
    return char_a * ([a, 2].min) if b == 0

    picked_a = [a, 2].min
    picked_b = a - picked_a >= b ? 1 : 0
    char_a * picked_a + char_b * picked_b + longest_diverse_string(a - picked_a, b - picked_b, c, char_a, char_b, char_c)
end
