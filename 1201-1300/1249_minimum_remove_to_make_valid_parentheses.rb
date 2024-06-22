# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
    remove_indexes = []
    (0...s.length).each do |i|
        next if s[i] != '(' && s[i] != ')'

        if !remove_indexes.empty? && s[remove_indexes[-1]] == '(' && s[i] == ')'
            remove_indexes.pop
        else
            remove_indexes.push(i)
        end
    end

    valid = []
    (0...s.length).each do |i|
        if remove_indexes[0] == i
            remove_indexes.shift
        else
            valid << s[i]
        end
    end

    valid.join('')
end
