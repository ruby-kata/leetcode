# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
    s_xor = s.chars.map(&:ord).reduce(&:^) || 0
    t_xor = t.chars.map(&:ord).reduce(&:^) || 0
    (t_xor ^ s_xor).chr
end
