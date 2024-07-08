# @param {String} s
# @param {Integer[]} indices
# @return {String}
def restore_string(s, indices)
    indices.zip(s.chars).sort_by(&:first).map(&:last).join
end
