# @param {String} s
# @return {Integer}
def min_changes(s)
    s.chars.each_slice(2).count { |a, b| a != b }
end
