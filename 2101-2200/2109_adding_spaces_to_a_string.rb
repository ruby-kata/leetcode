# @param {String} s
# @param {Integer[]} spaces
# @return {String}
def add_spaces(s, spaces)
    space = ' '.freeze
    modified_str = ''
    i = j = 0
    while i < s.length
        if i == spaces[j]
            modified_str << space
            j += 1
        end
        modified_str << s[i]
        i += 1
    end

    modified_str
end
