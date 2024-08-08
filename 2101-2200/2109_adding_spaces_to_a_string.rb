# @param {String} s
# @param {Integer[]} spaces
# @return {String}
def add_spaces(s, spaces)
    modiffied_str = ''
    i = j = 0
    while i < s.length
        if i == spaces[j]
            modiffied_str << ' '
            j += 1
        end
        modiffied_str << s[i]
        i += 1
    end

    modiffied_str
end
