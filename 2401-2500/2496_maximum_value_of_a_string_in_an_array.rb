# @param {String[]} strs
# @return {Integer}
def maximum_value(strs)
    strs.map { |s| s.match?(/[^0-9]+/) ? s.length : s.to_i }.max
end
