# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    s_counter = s.chars.tally
    t_counter = t.chars.tally

    s_counter == t_counter
end
