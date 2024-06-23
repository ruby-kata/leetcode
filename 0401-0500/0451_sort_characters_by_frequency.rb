# @param {String} s
# @return {String}
def frequency_sort(s)
    s.chars.tally.to_a
        .sort_by(&:last)
        .reverse
        .map { |c, freq| c * freq}
        .join("")
end
