# @param {String} s
# @param {String} part
# @return {String}
def remove_occurrences(s, part)
    while s.include?(part)
        # s.sub!(part)
        s.slice!(part) # faster
    end
    s
end
