# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    i = s.length-1
    i -= 1 while s[i] == " "
    len = 1
    len += 1 until i <= 0 || s[i -= 1] == " "
    len
end


def length_of_last_word(s)
    s.split(" ").last.length
end
