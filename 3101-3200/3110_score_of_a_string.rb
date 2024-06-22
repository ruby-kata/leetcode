# @param {String} s
# @return {Integer}
def score_of_string(s)
    s.chars.each_cons(2).inject(0) { |sum, (a, b)| sum += (a.ord - b.ord).abs }
end
